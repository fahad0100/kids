// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'verify_response.dart';

class VerifyResponseMapper extends ClassMapperBase<VerifyResponse> {
  VerifyResponseMapper._();

  static VerifyResponseMapper? _instance;
  static VerifyResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VerifyResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'VerifyResponse';

  static String _$id(VerifyResponse v) => v.id;
  static const Field<VerifyResponse, String> _f$id = Field('id', _$id);
  static String _$refresh(VerifyResponse v) => v.refresh;
  static const Field<VerifyResponse, String> _f$refresh = Field(
    'refresh',
    _$refresh,
  );
  static String _$token(VerifyResponse v) => v.token;
  static const Field<VerifyResponse, String> _f$token = Field('token', _$token);

  @override
  final MappableFields<VerifyResponse> fields = const {
    #id: _f$id,
    #refresh: _f$refresh,
    #token: _f$token,
  };

  static VerifyResponse _instantiate(DecodingData data) {
    return VerifyResponse(
      data.dec(_f$id),
      data.dec(_f$refresh),
      data.dec(_f$token),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static VerifyResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VerifyResponse>(map);
  }

  static VerifyResponse fromJson(String json) {
    return ensureInitialized().decodeJson<VerifyResponse>(json);
  }
}

mixin VerifyResponseMappable {
  String toJson() {
    return VerifyResponseMapper.ensureInitialized().encodeJson<VerifyResponse>(
      this as VerifyResponse,
    );
  }

  Map<String, dynamic> toMap() {
    return VerifyResponseMapper.ensureInitialized().encodeMap<VerifyResponse>(
      this as VerifyResponse,
    );
  }

  VerifyResponseCopyWith<VerifyResponse, VerifyResponse, VerifyResponse>
  get copyWith => _VerifyResponseCopyWithImpl<VerifyResponse, VerifyResponse>(
    this as VerifyResponse,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return VerifyResponseMapper.ensureInitialized().stringifyValue(
      this as VerifyResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return VerifyResponseMapper.ensureInitialized().equalsValue(
      this as VerifyResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return VerifyResponseMapper.ensureInitialized().hashValue(
      this as VerifyResponse,
    );
  }
}

extension VerifyResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VerifyResponse, $Out> {
  VerifyResponseCopyWith<$R, VerifyResponse, $Out> get $asVerifyResponse =>
      $base.as((v, t, t2) => _VerifyResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class VerifyResponseCopyWith<$R, $In extends VerifyResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? refresh, String? token});
  VerifyResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _VerifyResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VerifyResponse, $Out>
    implements VerifyResponseCopyWith<$R, VerifyResponse, $Out> {
  _VerifyResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VerifyResponse> $mapper =
      VerifyResponseMapper.ensureInitialized();
  @override
  $R call({String? id, String? refresh, String? token}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (refresh != null) #refresh: refresh,
      if (token != null) #token: token,
    }),
  );
  @override
  VerifyResponse $make(CopyWithData data) => VerifyResponse(
    data.get(#id, or: $value.id),
    data.get(#refresh, or: $value.refresh),
    data.get(#token, or: $value.token),
  );

  @override
  VerifyResponseCopyWith<$R2, VerifyResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _VerifyResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

