import 'package:injectable/injectable.dart';
import 'package:new_architecture/features/template/template_data.dart';

import '../../core/enum/app_state.dart';
import '../../core/view_model/view_model.dart';

@injectable
class TemplateViewModel extends ViewModel<TemplateData> {
  TemplateViewModel() : super(const TemplateData.initial());

  @override
  void updateState({
    AppState state = AppState.idle,
  }) {
    stateData = TemplateData(
      appState: state,
    );
  }
}
