import 'package:new_architecture/core/model/state_data.dart';

final class TemplateData extends StateData {
  const TemplateData({
    super.appState,
  });

  const TemplateData.initial();
  
  @override
  List<Object?> get props => [
        super.appState,
      ];
}
