const String baseScriptUrl = 'https://api.openai.com/v1/chat/completions';
const String baseImageUrl = 'https://api.openai.com/v1/images/generations';
const String baseVisionUrl = 'https://api.openai.com/v1/chat/completions';

//6 sentences를 1로 바꿈, 수정하자
import 'package:frontend/constants/const.dart';

const Map<String, dynamic> SCRIPT_PROMPT = {
  "model": "gpt-4o",
  "response_format": {"type": "json_object"},
  "messages": [
    {
      "role": "system",
      "content":
          "Output should be in JSON format. The story should have $NUMBER_OF_SCENE scenes. Some scene may include actions from the action list and animals from the animals list. Each scene must contain at least $NUMBER_OF_SENTENCE sentences. Action list is as follow, [\"왼손 번쩍\", \"오른손 번쩍\", \"양손 번쩍\", \"왼손 흔들기\", \"오른손 흔들기\", \"박수치기\"]. Animal list is as follow, [\"호랑이\", \"원숭이\", \"코끼리\", \"기린\", \"코알라\"]. Structure is as follow, {\"number_of_total_character\": 3, \"scene\": [{\"scene_number\": 1, \"number_of_character\": 2, \"character\": \"철수, 민희\"(in Korean), \"scene_contents\": \"철수와 민희가 만나 인사를 했어요\" (in Korean), \"description_of_illustration\": \"a playground in an apartment complex\" (in English, only the background, no characters), \"actions_used_in_action_list\": [\"양손 번쩍\"], \"animals_from_animal_list\": [\"코끼리\"]}, ...]}."
    },
    //아래 예시들 챗지피티로 만들어달라 하기. 위의 system이랑 형식이 맞지 않음
    {
      "role": "user",
      "content":
          "The theme is '흥부와 놀부'. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
    },
    {
      "role": "assistant",
      "content":
          "{\"number_of_total_character\": 2, \"scene\": [{\"scene_number\": 1, \"number_of_character\": 2, \"character\": \"흥부, 놀부\", \"scene_contents\": \"흥부와 놀부는 형제였지만 성격이 매우 달랐어요. 놀부는 부자였지만 인색했고, 흥부는 가난했지만 마음이 넓었어요. 하루는 흥부가 놀부의 집을 방문하여 도움을 청했어요. 놀부는 흥부의 부탁을 거절했고, 흥부는 실망하며 집으로 돌아갔어요. 놀부는 흥부를 멀리하며 차렷하기를 하였고, 흥부는 놀부를 바라보며 슬퍼했어요.\", \"description_of_illustration\": \"a wealthy Korean traditional house\", \"actions_used_in_action_list\": [\"차렷하기\"]}, {\"scene_number\": 2, \"number_of_character\": 1, \"character\": \"흥부\", \"scene_contents\": \"흥부가 집으로 돌아가던 중 상처받은 제비를 발견하였어요. 흥부는 제비의 다리에 붕대를 감아주고 정성껏 치료해 주었어요. 그 후, 제비는 건강을 회복하고 흥부에게 감사의 표시로 씨앗을 떨어뜨려 주었어요. 흥부는 씨앗을 심고, 매일 정성껏 물을 주었어요. 제비가 날아가며 왼손 번쩍을 하였고, 흥부는 박수치기를 하며 기뻐하였어요.\", \"description_of_illustration\": \"a small humble house with a garden\", \"actions_used_in_action_list\": [\"왼손 번쩍\", \"박수치기\"]}, {\"scene_number\": 3, \"number_of_character\": 2, \"character\": \"흥부, 놀부\", \"scene_contents\": \"그해 가을, 흥부가 심은 씨앗에서는 신비로운 호박이 자라났어요. 호박은 커다랗고 무거워 보였어요. 흥부는 호박을 깨뜨렸을 때, 그 안에서 금덩어리와 보석이 나왔어요. 소식을 들은 놀부는 놀라 흥부의 집을 방문하여 호박에 대해 물었어요. 놀부는 왼손 흔들기를 하며 질투심을 표현했고, 흥부는 그를 따뜻하게 맞이했어요.\", \"description_of_illustration\": \"a field with a large pumpkin\", \"actions_used_in_action_list\": [\"왼손 흔들기\"]}, {\"scene_number\": 4, \"number_of_character\": 2, \"character\": \"흥부, 놀부\", \"scene_contents\": \"놀부는 흥부에게 자신도 제비의 씨앗을 받기를 바랐어요. 흥부는 놀부에게 제비 씨앗의 비밀을 알려주었고, 놀부는 집으로 돌아가 씨앗을 심었어요. 놀부는 제비가 돌아오기를 기다리며 오른손 번쩍을 하였고, 흥부는 이 모습을 보고 조용히 미소 지었어요.\", \"description_of_illustration\": \"two Korean brothers in a traditional house garden\", \"actions_used_in_action_list\": [\"오른손 번쩍\"]}, {\"scene_number\": 5, \"number_of_character\": 1, \"character\": \"놀부\", \"scene_contents\": \"놀부가 심은 씨앗은 자라지 않았고, 그는 점점 더 좌절감을 느꼈어요. 제비도 돌아오지 않았고, 놀부는 자신의 욕심 때문에 실패했다고 생각했어요. 놀부는 마당에서 홀로 양손 번쩍을 하며 자신의 운명을 탓했어요. 흥부는 멀리서 이를 지켜보았고, 놀부를 도와주기로 결심했어요. 놀부는 자신의 행동을 반성하며 흥부에게 용서를 구하려 했어요.\", \"description_of_illustration\": \"a lonely man in a barren garden\", \"actions_used_in_action_list\": [\"양손 번쩍\"]}, {\"scene_number\": 6, \"number_of_character\": 2, \"character\": \"흥부, 놀부\", \"scene_contents\": \"흥부는 놀부에게 용서를 베풀고, 둘은 다시 형제애를 나누었어요. 흥부는 놀부에게 자신의 호박 밭에서 함께 일할 것을 제안했어요. 놀부는 기꺼이 수락하며 오른손 흔들기를 했어요. 두 형제는 박수치기를 하며 서로의 새로운 시작을 축하했어요. 그들은 다시금 행복하게 함께 살기 시작했어요.\", \"description_of_illustration\": \"two brothers working together in a pumpkin field\", \"actions_used_in_action_list\": [\"오른손 흔들기\", \"박수치기\"]}, {\"scene_number\": 7, \"number_of_character\": 1, \"character\": \"놀부\", \"scene_contents\": \"놀부는 호박 밭에서 일하며 성실하게 살기 시작했어요. 그는 이웃들에게도 친절하게 대하며 새로운 삶을 살았어요. 그는 농사를 짓는 동안 어려움도 겪었지만, 항상 긍정적인 태도를 유지했어요. 놀부는 제비를 다시 만나기를 희망하며 마음을 열었어요. 그의 진심은 마침내 제비를 불러들였고, 그는 감격스러워하며 박수치기를 했어요.\", \"description_of_illustration\": \"a man farming in a field with a bird flying overhead\", \"actions_used_in_action_list\": [\"박수치기\"]}, {\"scene_number\": 8, \"number_of_character\": 2, \"character\": \"흥부, 놀부\", \"scene_contents\": \"흥부와 놀부는 이제 서로를 믿고 의지하며 살아가게 되었어요. 그들은 매년 제비가 찾아오는 것을 함께 기다리며, 각자의 집에서도 제비를 위한 보금자리를 마련했어요. 둘은 이제 평화롭게 살아가며, 이웃과 함께 행복을 나누었어요. 그들의 이야기는 마을 사람들 사이에서 전해져, 많은 이들에게 희망과 용기를 주었어요. 두 형제는 끝으로 양손 번쩍을 하며 서로를 향해 웃었어요.\", \"description_of_illustration\": \"two happy brothers in a vibrant village\", \"actions_used_in_action_list\": [\"양손 번쩍\"]}]}"
    },
    {
      "role": "user",
      "content":
          "The theme is '금도끼 은도끼'. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
    },
    {
      "role": "assistant",
      "content":
          "{\"number_of_total_character\": 1, \"scene\": [{\"scene_number\": 1, \"number_of_character\": 1, \"character\": \"나무꾼\", \"scene_contents\": \"한 나무꾼이 산에서 나무를 자르던 중 도끼를 실수로 강에 빠뜨렸어요. 그는 도끼를 잃어버리고 매우 슬퍼했어요. 도끼 없이는 생계를 유지할 수 없어서 걱정이 많았어요. 강가에 앉아 하염없이 울기만 했어요. 그의 절실한 마음을 신이 느끼고 나타났어요. 신은 나무꾼에게 도끼를 찾아주겠다고 약속했어요.\", \"description_of_illustration\": \"a forested mountain with a river\", \"actions_used_in_action_list\": []}, {\"scene_number\": 2, \"number_of_character\": 1, \"character\": \"나무꾼\", \"scene_contents\": \"신은 물속에서 금도끼를 꺼내 나무꾼에게 보여주었어요. 나무꾼은 그것이 자신의 도끼가 아니라고 솔직하게 말했어요. 신은 나무꾼의 정직함에 감동받았어요. 나무꾼은 자신의 가난하지만 정직한 삶을 신에게 설명했어요. 신은 나무꾼의 말을 듣고 다시 물속으로 손을 넣어 다른 도끼를 꺼냈어요. 이번에는 은도끼였어요.\", \"description_of_illustration\": \"a river with a mystical figure holding an axe\", \"actions_used_in_action_list\": []}, {\"scene_number\": 3, \"number_of_character\": 1, \"character\": \"나무꾼\", \"scene_contents\": \"나무꾼은 은도끼도 자신의 도끼가 아니라고 거절했어요. 신은 이 정직한 행동에 또 다시 감동을 받았어요. 나무꾼은 간절히 자신의 낡은 철도끼를 원한다고 말했어요. 신은 나무꾼의 정직한 마음을 시험하기 위해 금도끼와 은도끼를 보여준 것이었어요. 이제 신은 마지막으로 물속에서 철도끼를 꺼내 나무꾼에게 돌려주었어요. 나무꾼은 자신의 도끼를 받고 매우 기뻐했어요.\", \"description_of_illustration\": \"a river with multiple axes\", \"actions_used_in_action_list\": []}, {\"scene_number\": 4, \"number_of_character\": 1, \"character\": \"나무꾼\", \"scene_contents\": \"신은 나무꾼의 정직함을 높이 평가하고, 금도끼와 은도끼도 선물로 주었어요. 나무꾼은 이 선물에 깊이 감사하며 신에게 고개를 숙였어요. 나무꾼은 이제 세 개의 도끼를 가지게 되었어요. 나무꾼은 자신의 행운을 믿을 수 없었어요. 그는 마을로 돌아가서 자신의 경험을 이웃과 공유했어요. 마을 사람들은 나무꾼의 정직함을 칭찬했어요.\", \"description_of_illustration\": \"a humble woodcutter receiving gifts from a deity\", \"actions_used_in_action_list\": []}, {\"scene_number\": 5, \"number_of_character\": 1, \"character\": \"나무꾼\", \"scene_contents\": \"소식을 들은 또 다른 나무꾼이 같은 강에 자신의 도끼를 일부러 빠뜨렸어요. 그는 신이 나타나길 기다렸고, 실제로 신이 나타났어요. 신은 이 나무꾼에게도 금도끼를 보여주었어요. 그러나 이 나무꾼은 금도끼가 자신의 도끼라고 거짓말을 했어요. 신은 그의 거짓말을 알아챘고, 실망한 표정을 지었다고 합니다. 이 나무꾼은 결국 아무 도끼도 받지 못했어요.\", \"description_of_illustration\": \"a deceitful man by the river\", \"actions_used_in_action_list\": []}, {\"scene_number\": 6, \"number_of_character\": 1, \"character\": \"나무꾼\", \"scene_contents\": \"첫 번째 나무꾼은 이 이야기를 듣고 그 사람에게 정직해야 한다고 조언했어요. 그는 자신의 경험을 바탕으로 정직이 최고의 정책이라고 말했어요. 나무꾼은 자신의 행운이 정직에서 비롯된 것을 다시 한번 깨달았어요. 그는 마을 사람들과 계속 좋은 관계를 유지하며 살았어요. 그는 신으로부터 받은 선물을 현명하게 사용했고, 마을의 존경을 받았어요. 나무꾼은 자신의 행복을 마을 사람들과 나누었어요.\", \"description_of_illustration\": \"a wise woodcutter advising another\", \"actions_used_in_action_list\": []}, {\"scene_number\": 7, \"number_of_character\": 1, \"character\": \"나무꾼\", \"scene_contents\": \"시간이 흘러, 나무꾼은 부유해졌고, 그의 정직함으로 인해 많은 사람들이 그를 돕고자 했어요. 그는 자신의 부를 마을 사람들과 나누며 그들의 삶을 향상시켰어요. 그의 선행은 주변 지역까지 소문이 나서 많은 사람들이 그를 찾아왔어요. 나무꾼은 자신의 경험을 바탕으로 젊은이들에게 가르침을 주었어요. 그는 항상 정직하고 성실한 삶을 강조했어요. 나무꾼은 이제 마을의 지혜로운 인물이 되었어요.\", \"description_of_illustration\": \"an affluent and respected woodcutter in his village\", \"actions_used_in_action_list\": []}, {\"scene_number\": 8, \"number_of_character\": 1, \"character\": \"나무꾼\", \"scene_contents\": \"나무꾼의 이야기는 세대를 거쳐 전해졌어요. 그의 이야기는 정직과 신뢰의 중요성을 교훈으로 남겼어요. 그는 물질적인 부보다 더 중요한 가치가 있다고 믿었어요. 그의 삶은 많은 사람들에게 영감을 주었고, 그의 전설은 오랫동안 기억될 것입니다. 나무꾼의 정직함은 그를 상징하는 금도끼, 은도끼와 함께 영원히 기억될 것입니다. 그는 자신의 도덕적 가치로 인해 영원히 존경 받는 인물이 되었어요.\", \"description_of_illustration\": \"an old woodcutter passing down his legacy\", \"actions_used_in_action_list\": []}]}"
    },
    {
      "role": "user",
      "content":
          ". Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
    }
  ]
};
const MUTABLE_SCRIPT_PROMPT = "The theme is ";

const Map<String, dynamic> IMAGE_PROMPT = {
  "model": "dall-e-3",
  "prompt":
      "I NEED to test how the tool works with extremely simple prompts. DO NOT add any detail, just use it AS-IS: Except for people, just draw the background. Just draw a picture that looks like a 7-year-old drew it with crayons! ",
  "quality": "hd",
  "style": "natural",
  "response_format": "b64_json"
};
const MUTABLE_IMAGE_PROMPT = "Please draw ";

const Map<String, dynamic> VISION_PROMPT = {
  "model": "gpt-4o",
  "response_format": {"type": "json_object"},
  "messages": [
    {
      "role": "user",
      "content": [
        {
          "type": "text",
          "text": "Output should be in JSON format. Is there any human or text? Structure is as follow: {\"human\": \"yes\" or \"no\", \"text\": \"yes\" or \"no\"}"
        },
        {
          "type": "image_url",
          "image_url": {"url": ""}
        }
      ]
    }
  ],
  "max_tokens": 300
};
