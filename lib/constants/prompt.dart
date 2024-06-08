//6 sentences를 1로 바꿈, 수정하자
import 'package:frontend/constants/const.dart';

const String baseScriptUrl = 'https://api.openai.com/v1/chat/completions';
const String baseImageUrl = 'https://api.openai.com/v1/images/generations';
const String baseVisionUrl = 'https://api.openai.com/v1/chat/completions';
const String baseTTSUrl = 'https://api.openai.com/v1/audio/speech';

const Map<String, dynamic> SCRIPT_PROMPT = {
  "model": "gpt-4o",
  "response_format": {"type": "json_object"},
  "messages": [
    {
      "role": "system",
      "content":
          "Output should be in JSON format. The story should have $NUMBER_OF_SCENE scenes. Some scene may include an action from the action list and animals from the animals list. Each scene must contain at least $NUMBER_OF_SENTENCE sentences. Action list is as follow, [\"왼손 번쩍\", \"오른손 번쩍\", \"양손 번쩍\", \"왼손 흔들기\", \"오른손 흔들기\", \"박수치기\"]. Animal list is as follow, [\"호랑이\", \"원숭이\", \"코끼리\", \"기린\", \"코알라\"]. Structure is as follow, {\"number_of_total_character\": 3, \"scene\": [{\"scene_number\": 1, \"number_of_character\": 2, \"characters\": [\"철수\", \"민희\"](in Korean), \"scene_contents\": \"철수와 민희가 만나 인사를 했어요\" (in Korean), \"description_of_illustration\": \"a playground in an apartment complex\" (in English, only the background, no characters), \"action_used_in_action_list\": \"양손 번쩍\", \"animals_from_animal_list\": [\"코끼리\"]}, ...]}."
    },
  ]
};
const USER_PART_SCRIPT_PROMPT = {
  "role": "user",
  "content":
      ". Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
};
const MUTABLE_SCRIPT_PROMPT = "The theme is ";

const Map<String, dynamic> IMAGE_PROMPT = {
  "model": TYPE_OF_DALLE,
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
          "text":
              "Output should be in JSON format. Is there any human or text? Structure is as follow: {\"human\": \"yes\" or \"no\", \"text\": \"yes\" or \"no\"}"
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

Map<String, dynamic> TTS_PROMPT = {
  "model": "tts-1-hd",
  "input": "",
  "voice": "shimmer",
  "response_format": "mp3"
};

const List<Map<String, dynamic>> EXAMPLE_REQUEST = [
  {
    "role": "user",
    "content":
        "The theme is 선녀와 나무꾼을 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {"role": "assistant", "content": ""},
  {
    "role": "user",
    "content":
        "The theme is 신데렐라를 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {"role": "assistant", "content": ""},
];

const List<Map<String, dynamic>> EXAMPLE_RESPONSE = [
  {
    "number_of_total_character": 3,
    "scene": [
      {
        "scene_number": 1,
        "number_of_character": 1,
        "characters": ["나무꾼"],
        "scene_contents":
            "나무꾼이 산속 깊은 곳에서 나무를 하고 있어요. 그는 오늘도 열심히 일을 하며 가족을 생각하고 있습니다. 나무꾼은 호랑이를 만나지 않을까 걱정합니다.",
        "description_of_illustration": "a deep, lush forest with tall trees",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_number": 2,
        "number_of_character": 1,
        "characters": ["나무꾼"],
        "scene_contents":
            "갑자기 호랑이가 나타나자 나무꾼은 놀라 양손을 번쩍 들어 올립니다. 호랑이는 나무꾼에게 다가와 위협적으로 으르렁거립니다. 나무꾼은 두려움에 떨며 숲속으로 도망칩니다.",
        "description_of_illustration":
            "a startled woodcutter raising his hands up as a tiger approaches",
        "action_used_in_action_list": "양손 번쩍",
        "animals_from_animal_list": ["호랑이"]
      },
      {
        "scene_number": 3,
        "number_of_character": 2,
        "characters": ["나무꾼", "선녀"],
        "scene_contents":
            "호랑이를 피해 숲속 깊숙한 곳으로 도망친 나무꾼은 우연히 선녀가 목욕하는 모습을 목격합니다. 선녀는 우아하게 계곡의 물가에서 옷을 벗고 있었습니다. 나무꾼은 숨어서 그 모습을 조용히 지켜봅니다.",
        "description_of_illustration":
            "a celestial maiden bathing at a secluded pond, observed by a hidden woodcutter",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_number": 4,
        "number_of_character": 2,
        "characters": ["나무꾼", "선녀"],
        "scene_contents":
            "나무꾼이 선녀의 옷을 몰래 가져가 숨깁니다. 선녀는 옷을 찾아 허둥지둥합니다. 그녀는 나무꾼에게 도움을 요청하며 왼손을 흔들어 보입니다.",
        "description_of_illustration":
            "a forest clearing with a pond where clothes are hidden",
        "action_used_in_action_list": "왼손 흔들기",
        "animals_from_animal_list": []
      },
      {
        "scene_number": 5,
        "number_of_character": 2,
        "characters": ["나무꾼", "선녀"],
        "scene_contents":
            "나무꾼이 선녀에게 옷을 돌려주겠다고 제안합니다. 선녀는 불안한 마음으로 나무꾼을 바라보며 고민합니다. 결국, 그녀는 나무꾼을 믿기로 하고 함께 마을로 향합니다.",
        "description_of_illustration":
            "a nervous maiden and a persuading woodcutter in the forest",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_number": 6,
        "number_of_character": 2,
        "characters": ["나무꾼", "선녀"],
        "scene_contents":
            "나무꾼과 선녀가 함께 살면서 평화롭게 지내기 시작합니다. 그들은 서로를 더 잘 알게 되고 마을 사람들과도 친해집니다.",
        "description_of_illustration":
            "a quaint village road with the woodcutter and the maiden walking together",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_number": 7,
        "number_of_character": 2,
        "characters": ["나무꾼", "선녀"],
        "scene_contents":
            "시간이 흘러 나무꾼과 선녀는 서로 사랑하게 되고, 아이들에게도 사랑 가득한 이야기를 들려줍니다. 그들은 행복하게 오래오래 살았습니다.",
        "description_of_illustration":
            "a happy family scene with the woodcutter and the celestial maiden",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_number": 8,
        "number_of_character": 1,
        "characters": ["선녀"],
        "scene_contents":
            "선녀가 마침내 자신의 옷을 찾아 하늘로 돌아갑니다. 나무꾼은 선녀가 사라지는 모습을 멀리서 지켜보며 슬퍼합니다. 그녀의 떠나는 모습을 오래도록 바라보았습니다.",
        "description_of_illustration":
            "a celestial maiden ascending to the heavens, leaving the woodcutter behind",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      }
    ]
  },
  {
    "number_of_total_character": 4,
    "scene": [
      {
        "scene_number": 1,
        "number_of_character": 1,
        "characters": ["신데렐라"],
        "scene_contents":
            "신데렐라는 불친절한 계모와 언니들과 함께 살고 있습니다. 그녀는 매일 집안일을 하며 가족을 돌보지만, 종종 꿈을 꾸며 더 나은 미래를 상상합니다.",
        "description_of_illustration":
            "a cozy, slightly cluttered kitchen with Cinderella cleaning",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_number": 2,
        "number_of_character": 1,
        "characters": ["신데렐라"],
        "scene_contents":
            "왕궁에서 무도회 초대장이 도착합니다. 신데렐라는 무도회에 참석할 수 없음을 알고 슬퍼합니다. 하지만 그녀는 비밀리에 춤 연습을 계속합니다.",
        "description_of_illustration":
            "Cinderella holding an invitation while sadly practicing her dance moves",
        "action_used_in_action_list": "왼손 흔들기",
        "animals_from_animal_list": []
      },
      {
        "scene_number": 3,
        "number_of_character": 1,
        "characters": ["신데렐라"],
        "scene_contents":
            "무도회 날이 되었지만 신데렐라는 집에 남겨집니다. 그녀는 혼자 울며 자신도 무도회에 갈 수 있었으면 좋겠다고 소망합니다.",
        "description_of_illustration":
            "Cinderella crying alone at home with a broom in her hand",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_number": 4,
        "number_of_character": 1,
        "characters": ["신데렐라"],
        "scene_contents":
            "신데렐라의 소원을 들은 요정 대모가 나타나 그녀에게 마법을 걸어 줍니다. 멋진 드레스와 유리 구두가 마법으로 나타납니다.",
        "description_of_illustration":
            "Cinderella transforming with the help of her fairy godmother, sparkles everywhere",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_number": 5,
        "number_of_character": 1,
        "characters": ["신데렐라"],
        "scene_contents":
            "마법으로 변한 호박이 마차가 되고, 기린이 경호원으로 변합니다. 신데렐라는 무도회에 갈 준비를 마칩니다.",
        "description_of_illustration":
            "a magical carriage and a giraffe dressed as a footman, Cinderella steps in",
        "action_used_in_action_list": "오른손 번쩍",
        "animals_from_animal_list": ["기린"]
      },
      {
        "scene_number": 6,
        "number_of_character": 1,
        "characters": ["신데렐라"],
        "scene_contents":
            "무도회에서 신데렐라는 모든 이의 시선을 사로잡습니다. 사람들은 그녀의 아름다운 드레스와 우아한 춤사위에 감탄합니다.",
        "description_of_illustration":
            "Cinderella dancing alone in the ballroom, captivating everyone",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_number": 7,
        "number_of_character": 1,
        "characters": ["신데렐라"],
        "scene_contents":
            "자정이 가까워지자 신데렐라는 서둘러 무도회장을 떠나야 합니다. 그녀는 계단을 내려가다가 유리 구두 한 짝을 잃어버립니다.",
        "description_of_illustration":
            "Cinderella rushing down the palace stairs, losing a glass slipper",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_number": 8,
        "number_of_character": 2,
        "characters": ["신데렐라", "왕자"],
        "scene_contents":
            "왕자는 신데렐라의 유리 구두를 가지고 왕국 전체를 돌아다니며 진짜 주인을 찾습니다. 결국 신데렐라의 발에 딱 맞는 구두를 찾고, 둘은 행복하게 재회합니다.",
        "description_of_illustration":
            "the prince fitting the glass slipper on Cinderella's foot",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      }
    ]
  }
];
