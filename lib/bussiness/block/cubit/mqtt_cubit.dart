
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/mqtt_repo.dart';
import 'mqtt_states.dart';

class MqttCubit extends Cubit<MqttStates>
{
  MqttCubit(this.mqttRepo):super(MqttInitialStates());
  static MqttCubit get(context)=>BlocProvider.of<MqttCubit>(context);

  late MqttRepo mqttRepo;
  Future<void> connect(pubTopic)
   async {
    emit(MqttLoadingStates());
     try
     {
       emit(MqttSuccessStates());

       await  mqttRepo.setupMqttClient(pubTopic);
     }
     catch (e)
     {
       emit(MqttErrorStates(e.toString()));

     }
  }

  void getMessage()
  {
    mqttRepo.setupUpdatesListener();
  }
  void publishMessage({required topic,required message})
  {
    mqttRepo.publishMessage(topic, message);

  }
}