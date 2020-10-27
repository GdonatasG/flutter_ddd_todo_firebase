// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteDTO _$_$_NoteDTOFromJson(Map<String, dynamic> json) {
  return _$_NoteDTO(
    body: json['body'] as String,
    color: json['color'] as int,
    listOfTodo: (json['listOfTodo'] as List)
        ?.map((e) =>
            e == null ? null : TodoItemDTO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    serverTimeStamp:
        const ServerTimestampConverter().fromJson(json['serverTimeStamp']),
  );
}

Map<String, dynamic> _$_$_NoteDTOToJson(_$_NoteDTO instance) =>
    <String, dynamic>{
      'body': instance.body,
      'color': instance.color,
      'listOfTodo': instance.listOfTodo?.map((e) => e?.toJson())?.toList(),
      'serverTimeStamp':
          const ServerTimestampConverter().toJson(instance.serverTimeStamp),
    };

_$_TodoItemDTO _$_$_TodoItemDTOFromJson(Map<String, dynamic> json) {
  return _$_TodoItemDTO(
    id: json['id'] as String,
    name: json['name'] as String,
    isDone: json['isDone'] as bool,
  );
}

Map<String, dynamic> _$_$_TodoItemDTOToJson(_$_TodoItemDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isDone': instance.isDone,
    };
