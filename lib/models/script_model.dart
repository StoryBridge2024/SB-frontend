class RefinedScriptModel{

}
class OriginalScriptModel {
  final String id, model, system_fingerprint, object;
  final int created;
  final List<dynamic> choices;
  final usage;

  OriginalScriptModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        created = json['created'],
        model = json['model'],
        system_fingerprint = json['system_fingerprint'],
        object = json['object'],
        choices = json['choices'],
        usage = json['usage'];
}
