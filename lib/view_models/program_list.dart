import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jadio_recorder_ui/apis/recorder_api_client.dart';
import 'package:jadio_recorder_ui/models/program.dart';
import 'package:jadio_recorder_ui/repositories/recorder.dart';

final programListViewModelProvider =
    StateNotifierProvider<ProgramListViewModel, AsyncValue<List<Program>>>(
  (ref) => ProgramListViewModel(RecorderRepository(
    apiClient: RecorderApiClient(Dio()),
  )),
);

class ProgramListViewModel extends StateNotifier<AsyncValue<List<Program>>> {
  ProgramListViewModel(this._recorderRepository)
      : super(const AsyncLoading<List<Program>>()) {
    fetch();
  }

  final RecorderRepository _recorderRepository;
  int page = 0;
  int items = 20;
  String status = "recorded";

  Future<void> fetch({
    bool isLoadMore = false,
  }) async {
    state = await AsyncValue.guard(() async {
      final data = await _recorderRepository.programs(page, items, status);
      return [if (isLoadMore) ...state.value ?? [], ...data];
    });
  }

  void loadMore() {
    if (state == const AsyncLoading<List<Program>>().copyWithPrevious(state)) {
      return;
    }

    state = const AsyncLoading<List<Program>>().copyWithPrevious(state);
    page++;
    fetch(isLoadMore: true);
  }

  void refresh() {
    state = const AsyncLoading<List<Program>>().copyWithPrevious(state);
    page = 1;
    fetch();
  }
}
