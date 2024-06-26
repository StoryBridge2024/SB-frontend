class ScriptModel {
  final String scene_contents, description_of_illustration;
  String? action_used_in_action_list;
  final List<String> animals_from_animal_list;

  ScriptModel.fromJson(Map<String, dynamic> json)
      : scene_contents = json['scene_contents'] ??
            (throw ArgumentError('scene_contents cannot be null')),
        description_of_illustration = json['description_of_illustration'] ??
            (throw ArgumentError('description_of_illustration cannot be null')),
        action_used_in_action_list = json['action_used_in_action_list'],
        animals_from_animal_list = (json['animals_from_animal_list'] != null)
            ? List<String>.from(json['animals_from_animal_list'])
            : (throw ArgumentError('animals_from_animal_list cannot be null'));

  Map<String, dynamic> toJson() {
    return {
      'scene_contents': scene_contents,
      'description_of_illustration': description_of_illustration,
      'action_used_in_action_list': action_used_in_action_list,
      'animals_from_animal_list': animals_from_animal_list,
    };
  }
}

class ScriptResponse {
  final String id, model, object;
  final String? system_fingerprint;
  final int created;
  final List<dynamic> choices;
  final usage;

  ScriptResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? (throw ArgumentError('id cannot be null')),
        created =
            json['created'] ?? (throw ArgumentError('created cannot be null')),
        model = json['model'] ?? (throw ArgumentError('model cannot be null')),
        system_fingerprint = json['system_fingerprint'],
        object =
            json['object'] ?? (throw ArgumentError('object cannot be null')),
        choices =
            json['choices'] ?? (throw ArgumentError('choices cannot be null')),
        usage = json['usage'] ?? (throw ArgumentError('usage cannot be null'));
}
