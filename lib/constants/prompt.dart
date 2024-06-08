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
          "Output should be in JSON format. The story should have $NUMBER_OF_SCENE scenes. Some scene may include an action from the action list and animals from the animals list. Each scene must contain at least $NUMBER_OF_SENTENCE sentences. Action list is as follow, [\"왼손 번쩍\", \"오른손 번쩍\", \"양손 번쩍\", \"왼손 흔들기\", \"오른손 흔들기\", \"박수치기\"]. Animal list is as follow, [\"호랑이\", \"원숭이\", \"코끼리\", \"기린\", \"코알라\"]. Structure is as follow, {\"primary_character\": 철수, \"scenes\": [{\"scene_contents\": \"철수와 민희가 만나 인사를 했어요\" (in Korean), \"description_of_illustration\": \"a playground in an apartment complex\" (in English, only the background, no characters, no animals), \"action_used_in_action_list\": \"양손 번쩍\", \"animals_from_animal_list\": [\"코끼리\"]}, ...]}."
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
              "Output should be in JSON format. Is there any human or text or animal? Structure is as follow: {\"human\": \"yes\" or \"no\", \"text\": \"yes\" or \"no\", \"animal\": \"yes\" or \"no\"}"
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
  {
    "role": "user",
    "content":
        "The theme is 잭과 콩나무를 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {"role": "assistant", "content": ""},
  {
    "role": "user",
    "content":
        "The theme is 벌거벗은 임금님을 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {"role": "assistant", "content": ""},
];

const List<Map<String, dynamic>> EXAMPLE_RESPONSE = [
  {
    "primary_character": "나무꾼",
    "scenes": [
      {
        "scene_contents":
            "나무꾼이 산속 깊은 곳에서 나무를 하고 있어요. 그는 오늘도 열심히 일을 하며 가족을 생각하고 있습니다. 나무꾼은 호랑이를 만나지 않을까 걱정합니다.",
        "description_of_illustration": "a deep, lush forest with tall trees",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "갑자기 호랑이가 나타나자 나무꾼은 놀라 양손을 번쩍 들어 올립니다. 호랑이는 나무꾼에게 다가와 위협적으로 으르렁거립니다. 나무꾼은 두려움에 떨며 숲속으로 도망칩니다.",
        "description_of_illustration": "a wooded forest",
        "action_used_in_action_list": "양손 번쩍",
        "animals_from_animal_list": ["호랑이"]
      },
      {
        "scene_contents":
            "호랑이를 피해 숲속 깊숙한 곳으로 도망친 나무꾼은 우연히 선녀가 목욕하는 모습을 목격합니다. 선녀는 우아하게 계곡의 물가에서 옷을 벗고 있었습니다. 나무꾼은 숨어서 그 모습을 조용히 지켜봅니다.",
        "description_of_illustration": "a pond in the woods",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents": "나무꾼이 선녀의 옷을 몰래 가져가 숨깁니다. 선녀는 옷을 찾아 허둥지둥합니다.",
        "description_of_illustration":
            "a forest clearing with a pond where clothes are hidden",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "나무꾼이 왼손 흔들기를 하며 선녀에게 옷을 돌려주겠다고 제안합니다. 선녀는 불안한 마음으로 나무꾼을 바라보며 고민합니다. 결국, 그녀는 나무꾼을 믿기로 하고 함께 마을로 향합니다.",
        "description_of_illustration": "a path in the forest",
        "action_used_in_action_list": "왼손 흔들기",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "나무꾼과 선녀가 함께 살면서 평화롭게 지내기 시작합니다. 그들은 서로를 더 잘 알게 되고 마을 사람들과도 친해집니다.",
        "description_of_illustration": "a quaint village road with",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "시간이 흘러 나무꾼과 선녀는 서로 사랑하게 되고, 아이들에게도 사랑 가득한 이야기를 들려줍니다. 그들은 행복하게 오래오래 살았습니다.",
        "description_of_illustration": "inside a house in the village",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "선녀가 마침내 자신의 옷을 찾아 하늘로 돌아갑니다. 나무꾼은 선녀가 사라지는 모습을 멀리서 보며 오른손 흔들기를 합니다. 그녀의 떠나는 모습을 오래도록 바라보았습니다.",
        "description_of_illustration": "sky",
        "action_used_in_action_list": "오른손 흔들기",
        "animals_from_animal_list": []
      }
    ]
  },
  {
    "primary_character": "신데렐라",
    "scenes": [
      {
        "scene_contents":
            "신데렐라는 불친절한 계모와 언니들과 함께 살고 있습니다. 그녀는 매일 집안일을 하며 가족을 돌보지만, 종종 꿈을 꾸며 더 나은 미래를 상상합니다.",
        "description_of_illustration": "a cozy, slightly cluttered kitchen",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "왕궁에서 무도회 초대장이 도착합니다. 신데렐라는 무도회에 참석할 수 없음을 알고 슬퍼합니다. 하지만 그녀는 비밀리에 춤 연습을 계속합니다.",
        "description_of_illustration": "Dance practice room",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "무도회 날이 되었지만 신데렐라는 집에 남겨집니다. 그녀는 혼자 울며 자신도 무도회에 갈 수 있었으면 좋겠다고 소망합니다.",
        "description_of_illustration": "the interior of a room",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "신데렐라의 소원을 들은 요정이 나타나 그녀에게 마법을 걸어 줍니다. 멋진 드레스와 유리 구두가 나타납니다.",
        "description_of_illustration":
            "The background of the magical appearance of dresses and glass shoes in the house",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "마법으로 변한 호박이 마차가 되고, 기린이 경호원으로 변합니다. 신데렐라는 무도회에 갈 준비를 마칩니다. 신데렐라는 기분이 좋아 양손 번쩍하기를 하며 만세를 합니다",
        "description_of_illustration": "a carriage on the road",
        "action_used_in_action_list": "양손 번쩍",
        "animals_from_animal_list": ["기린"]
      },
      {
        "scene_contents":
            "무도회에서 신데렐라는 모든 이의 시선을 사로잡습니다. 사람들은 그녀의 아름다운 드레스와 우아한 춤사위에 감탄합니다.",
        "description_of_illustration": "a grand, high-end ball",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "자정이 가까워지자 신데렐라는 서둘러 무도회장을 떠나야 합니다. 그녀는 계단을 내려가다가 유리 구두 한 짝을 잃어버립니다.",
        "description_of_illustration": "glass shoes on the side of the road",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "왕자는 신데렐라의 유리 구두를 가지고 왕국 전체를 돌아다니며 진짜 주인을 찾습니다. 결국 신데렐라의 발에 딱 맞는 구두를 찾고, 둘은 행복하게 재회합니다.",
        "description_of_illustration": "royal place",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      }
    ]
  },
  {
    "primary_character": "잭",
    "scenes": [
      {
        "scene_contents":
            "잭과 그의 엄마는 가난한 생활을 하고 있습니다. 어느 날, 잭의 엄마는 잭에게 마지막 소를 시장에 팔러 가라고 지시합니다.",
        "description_of_illustration": "a cow on a farm in a poor house",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "잭은 시장에 가는 길에 신비로운 남자를 만나고, 소를 마법의 콩 몇 알로 바꾸게 됩니다. 잭은 기대감에 차서 집으로 돌아갑니다.",
        "description_of_illustration": "magic beans",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "잭이 마법의 콩을 가져오자, 엄마는 화를 내며 콩을 창밖으로 던져 버립니다. 그녀는 잭이 어리석었다고 생각합니다.",
        "description_of_illustration": "beans thrown out the window",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "다음 날 아침, 잭은 집 밖에서 하늘 높이 솟은 거대한 콩나무를 발견합니다. 그는 호기심을 참지 못하고 콩나무를 타기 시작합니다.",
        "description_of_illustration":
            "giant beanstalk reaching into the clouds",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "잭은 콩나무를 타고 구름 위에 있는 거인의 성에 도착합니다. 그는 조심스럽게 성 안으로 들어가 보물을 찾기 시작합니다.",
        "description_of_illustration": "giant's castle above the clouds",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "거인의 집에서 잭은 거인이 코알라를 키우는 것을 목격하며 숨어 있습니다. 그는 거인이 졸고 있는 동안 황금알을 낳는 거위를 발견합니다.",
        "description_of_illustration": "giant sleeps nearby",
        "action_used_in_action_list": "",
        "animals_from_animal_list": ["코알라"]
      },
      {
        "scene_contents":
            "잭은 거위를 들고 조용히 콩나무를 타고 내려갑니다. 그는 거인의 추적을 피하기 위해 빠르게 움직입니다.",
        "description_of_illustration": "castle above the clouds",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "잭은 안전하게 집에 도착하고, 그의 엄마는 잭의 성공을 자랑스럽게 생각합니다. 둘은 이제 부유하게 살 수 있게 되었습니다. 행복해서 둘 다 양손을 들어 만세를 합니다.",
        "description_of_illustration": "a poor house",
        "action_used_in_action_list": "양손 번쩍",
        "animals_from_animal_list": []
      }
    ]
  },
  {
    "primary_character": "임금님",
    "scenes": [
      {
        "scene_contents":
            "임금님은 아름다운 옷을 사랑하고, 항상 최신 패션을 입으려고 합니다. 그는 옷에 많은 돈을 쓰며 자신의 외모를 국가 운영보다 중요하게 생각합니다.",
        "description_of_illustration":
            "A vast wardrobe filled with luxurious garments.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "두 명의 사기꾼이 나타나 임금님에게 접근합니다. 그들은 보이지 않는 특별한 옷을 짜 주겠다고 제안하며, 이 옷은 바보나 직무에 부적합한 사람에게만 보이지 않는다고 주장합니다.",
        "description_of_illustration":
            "'Invisible' fabric displayed by swindlers.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "임금님은 자신이 어리석지 않음을 증명하고자 이 옷을 주문합니다. 그는 눈에 보이지 않는 옷을 입고 자신의 모습을 상상하며 흥분합니다.",
        "description_of_illustration": "An empty loom with colorful threads.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "사기꾼들은 임금님에게 '옷'을 보여 주며 임금님은 실제로 아무 것도 보이지 않지만 감탄을 합니다. 그는 자신의 판단을 의심하지 않으려고 합니다.",
        "description_of_illustration":
            "An ornate, empty throne next to an empty loom.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "임금님은 대대적인 행진을 위해 '새 옷'을 입고 나타납니다. 그는 사람들이 자신의 화려한 복장에 감탄할 것이라 기대합니다.",
        "description_of_illustration":
            "A bustling street lined with spectators.",
        "action_used_in_action_list": "왼손 흔들기",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "행진 도중 어린 아이가 임금님이 벌거벗었다고 외칩니다. 사람들은 속삭이기 시작하며 진실을 깨닫습니다.",
        "description_of_illustration":
            "Crowd murmuring among themselves, looking puzzled.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "임금님은 처음엔 당황하지만, 점점 자신이 속았음을 인정하게 됩니다. 그러나 그는 계속 걸으며 행진을 마칩니다.",
        "description_of_illustration":
            "A long parade route with a crowd watching solemnly.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "행진이 끝난 후 임금님은 어린 아이에게 진실을 말한 것에 대해 감사를 표합니다. 임금님은 이 경험을 통해 더 지혜로운 리더가 되겠다고 다짐합니다.",
        "description_of_illustration": "A peaceful city square in the evening.",
        "action_used_in_action_list": "오른손 번쩍",
        "animals_from_animal_list": []
      }
    ]
  }
];
