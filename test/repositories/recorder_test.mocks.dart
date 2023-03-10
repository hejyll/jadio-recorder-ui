// Mocks generated by Mockito 5.3.2 from annotations
// in jadio_recorder_ui/test/repositories/recorder_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:jadio_recorder_ui/apis/recorder_api_client.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [RecorderApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockRecorderApiClient extends _i1.Mock implements _i2.RecorderApiClient {
  MockRecorderApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> programs(
    int? page,
    int? items,
    String? status,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #programs,
          [
            page,
            items,
            status,
          ],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
}
