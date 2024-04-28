import 'package:mqtt_client/mqtt_client.dart';

import '../services/MQTTClientServicer.dart';

class MqttRepo
{

  MQTTClientManager mqttClientManager=MQTTClientManager();

  bool? isConnect;

  Future<void> setupMqttClient(pubTopic) async {
    try
    {
      await mqttClientManager.connect();
      mqttClientManager.subscribe(pubTopic);
      isConnect=true;
    }catch (e)
    {
      print(e);
      isConnect=false;
    }
  }

  void setupUpdatesListener() {
    mqttClientManager
        .getMessagesStream()!
        .listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print("meeeeesage");
      print(pt);
    });
  }
  void publishMessage(String topic, String message) async {
    mqttClientManager.publishMessage(topic, message);
  }
}
