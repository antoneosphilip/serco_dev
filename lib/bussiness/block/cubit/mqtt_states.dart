abstract class MqttStates{}
class MqttInitialStates extends MqttStates{}
class MqttLoadingStates extends MqttStates{}

class MqttSuccessStates extends MqttStates{}
class MqttErrorStates extends MqttStates
{
  final String err;

  MqttErrorStates(this.err);
}

class MqttPublishMessageLoadingStates extends MqttStates{}

class MqttPublishMessageSuccessStates extends MqttStates{}
class MqttPublishMessageErrorStates extends MqttStates
{
  final String err;

  MqttPublishMessageErrorStates(this.err);
}