import 'dart:io';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';


class MQTTClientManager {
  MqttServerClient client =
  MqttServerClient.withPort('broker.emqx.io', '1', 1883);

  Future<int> connect() async {
    client.logging(on: true);
    client.keepAlivePeriod = 60;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;

    final connMessage =
    MqttConnectMessage().startClean().withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;

    try {
      await client.connect();

    } on NoConnectionException catch (e) {
      print("desssssssssssssssss");
      print('MQTTClient::Client exception - $e');
      client.disconnect();
      Future.delayed(Duration(seconds: 5), () => connect());

    } on SocketException catch (e) {
      print("desssssssssssssssss");

      print('MQTTClient::Socket exception - $e');
      client.disconnect();
      Future.delayed(Duration(seconds: 5), () => connect());

    }

    return 0;
  }

  void disconnect(){
    print("desssssssssssssssss");

    client.disconnect();
    Future.delayed(Duration(seconds: 5), () => connect());


  }

  void subscribe(String topic) {
    client.subscribe(topic, MqttQos.atLeastOnce);
  }

  void onConnected() {
    print('MQTTClient::Connected');
  }

  void onDisconnected() {
    print('MQTTClient::Disconnected');
    connect();

  }

  void onSubscribed(String topic) {
    print('MQTTClient::Subscribed to topic: $topic');
  }

  void pong() {
    print('MQTTClient::Ping response received');
  }

  void publishMessage(String topic, String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
  }

  Stream<List<MqttReceivedMessage<MqttMessage>>>? getMessagesStream() {
    return client.updates;
  }
}