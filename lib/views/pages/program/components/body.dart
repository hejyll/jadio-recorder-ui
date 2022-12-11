import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jadio_recorder_ui/models/program.dart';
import 'package:jadio_recorder_ui/view_models/program_list.dart';
import 'package:jadio_recorder_ui/views/components/on_going_bottom.dart';
import 'package:jadio_recorder_ui/views/pages/program/components/list.dart';

class ProgramPageBody extends HookConsumerWidget {
  const ProgramPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Program>> asyncValue =
      ref.watch(programListViewModelProvider);

    return NotificationListener<ScrollEndNotification>(
      child: Scrollbar(
        child: CustomScrollView(
          restorationId: 'programs',
          slivers: <Widget>[
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                ref.read(programListViewModelProvider.notifier).refresh();
              },
            ),
            asyncValue.when(
              data: (data) {
                return ProgramList(data: data);
              },
              error: (error, stackTrace) {
                if (asyncValue.hasValue) {
                  return ProgramList(data: asyncValue.value!);
                }
                return const SliverPadding(
                  padding: EdgeInsets.all(24.0),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: Text('ProgramPageBody: error'),
                    ),
                  ),
                );
              },
              loading: () {
                return const SliverPadding(
                  padding: EdgeInsets.all(24.0),
                  sliver: SliverToBoxAdapter(
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                );
              },
            ),
            OnGoingBottom(
              asyncValue: asyncValue,
            ),
          ],
        ),
      ),
      onNotification: (notification) {
        if (notification.metrics.extentAfter == 0) {
          ref.read(programListViewModelProvider.notifier).loadMore();
          return true;
        }
        return false;
      },
    );
  }
}
