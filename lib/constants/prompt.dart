//6 sentences를 1로 바꿈, 수정하자
const Map<String, dynamic> SCRIPT_PROMPT = {
  "model": "gpt-4-turbo-preview",
  "response_format": {"type": "json_object"},
  "messages": [
    {
      "role": "system",
      "content":
          "Output should be in JSON format. The story should have 8 scenes. Each scene should include at least one action from the action list. Each scene must contain at least 1 sentences. Action list is as follow, [\"왼손 번쩍\", \"오른손 번쩍\", \"양손 번쩍\", \"왼손 흔들기\", \"오른손 흔들기\", \"차렷하기\", \"박수치기\"]. Structure is as follow, {\"number_of_total_character\": 3, \"scene\": [{\"scene_number\": 1, \"number_of_character\": 2, \"character\": \"철수, 민희\"(in Korean), \"scene_contents\": \"철수와 민희가 만나 인사를 했어요\" (in Korean), \"description_of_illustration\": \"a playground in an apartment complex\" (in English, only the background, no characters), \"actions_used_in_action_list\": [\"양손 번쩍\"]}, ...]}."
    },
    {
      "role": "user",
      "content":
          ". Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
    }
  ]
};
const MUTABLE_SCRIPT_PROMPT = "The theme is ";

const IMAGE_PROMPT = {
  "model": "dall-e-3",
  "prompt":
      "I NEED to test how the tool works with extremely simple prompts. DO NOT add any detail, just use it AS-IS: Just draw a picture that looks like a 7-year-old drew it with crayons! ",
  "quality": "hd",
  "style": "natural",
  "response_format": "b64_json"
};
const MUTABLE_IMAGE_PROMPT = "Please draw ";
