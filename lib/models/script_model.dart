class ScriptModel {
  final int number_of_character;
  final String character, scene_contents, description_of_illustration;
  final List<String> actions_used_in_action_list;

  ScriptModel.fromJson(Map<String, dynamic> json)
      : number_of_character = json['number_of_character'],
        character = json['character'],
        scene_contents = json['scene_contents'],
        description_of_illustration = json['description_of_illustration'],
        actions_used_in_action_list =
            List<String>.from(json['actions_used_in_action_list']);
}

class ScriptResponse {
  final String id, model, object;
  final String? system_fingerprint;
  final int created;
  final List<dynamic> choices;
  final usage;

  ScriptResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        created = json['created'],
        model = json['model'],
        system_fingerprint = json['system_fingerprint'],
        object = json['object'],
        choices = json['choices'],
        usage = json['usage'];
}
