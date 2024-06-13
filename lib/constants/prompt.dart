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
          "Output should be in JSON format. The story should have $NUMBER_OF_SCENE scenes. Some scene may include an action from the action list and animals from the animals list. Include selected animals and behaviors in the fairy tale. Each scene must contain at least $NUMBER_OF_SENTENCE sentences. Action list is as follow, [\"왼손 번쩍\", \"오른손 번쩍\", \"양손 번쩍\", \"왼손 흔들기\", \"오른손 흔들기\", \"박수치기\"]. Animal list is as follow, [\"호랑이\", \"원숭이\", \"코끼리\", \"기린\", \"코알라\"]. Structure is as follow, {\"primary_character\": 철수, \"scenes\": [{\"scene_contents\": \"철수와 민희가 만나 인사를 했어요\" (in Korean), \"description_of_illustration\": \"a playground in an apartment complex\" (in English, only the background, no characters, no animals), \"action_used_in_action_list\": \"양손 번쩍\", \"animals_from_animal_list\": [\"코끼리\"]}, ...]}."
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
  {
    "role": "user",
    "content":
        "The theme is 신데렐라를 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {
    "role": "user",
    "content":
        "The theme is 잭과 콩나무를 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {
    "role": "user",
    "content":
        "The theme is 벌거벗은 임금님을 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {
    "role": "user",
    "content":
        "The theme is 인어공주를 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {
    "role": "user",
    "content":
        "The theme is 성냥팔이 소녀를 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {
    "role": "user",
    "content":
        "The theme is 오즈의 마법사를 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {
    "role": "user",
    "content":
        "The theme is 거짓말쟁이 양치기 소년을 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {
    "role": "user",
    "content":
        "The theme is 임금님 귀는 당나귀 귀를 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {
    "role": "user",
    "content":
        "The theme is 피노키오를 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
  {
    "role": "user",
    "content":
        "The theme is 황금 달걀을 각색해줘. Ensure each scene smoothly integrates actions that are appropriate for the storyline and have the main character perform those actions."
  },
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
  },
  {
    "primary_character": "인어공주",
    "scenes": [
      {
        "scene_contents":
            "인어공주는 바다 왕국에서 다섯 자매와 함께 살고 있습니다. 그녀는 자신의 생일에 바다 위로 수면을 넘어 인간 세계를 볼 수 있는 기회를 갖습니다.",
        "description_of_illustration":
            "A beautiful underwater castle surrounded by colorful coral reefs.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "인어공주는 바다 위로 올라와 아름다운 선박을 발견하고, 선박 위의 멋진 왕자를 처음 보게 됩니다. 왕자의 생일 축하 행사가 선박 위에서 열리고 있었습니다.",
        "description_of_illustration":
            "A majestic ship sailing on the calm sea at sunset.",
        "action_used_in_action_list": "왼손 번쩍",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "갑자기 폭풍이 몰아치고 인어공주는 왕자가 바다에 빠지는 것을 보게 됩니다. 그녀는 망설임 없이 왕자를 구하기 위해 물속으로 뛰어듭니다.",
        "description_of_illustration":
            "Dark clouds and high waves during a storm at sea.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "인어공주는 의식을 잃은 왕자를 해변까지 데리고 가서 목숨을 구합니다. 왕자는 공주를 보지 못하고 다른 사람이 자신을 구한 것으로 생각합니다.",
        "description_of_illustration":
            "A serene beach at dawn with gentle waves lapping the shore.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "인어공주는 사랑에 빠져 인간이 되기를 원합니다. 그녀는 자신의 목소리를 잃는 대가로 바다 마녀에게서 인간이 될 수 있는 묘약을 받습니다. 인어공주는 기뻐 박수치기를 합니다.",
        "description_of_illustration":
            "A dark, eerie underwater cave with mysterious glowing plants.",
        "action_used_in_action_list": "박수치기",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "인간이 된 인어공주는 왕자의 궁전으로 가서 그와 함께 시간을 보냅니다. 그러나 왕자는 다른 공주와 결혼하겠다고 발표합니다.",
        "description_of_illustration":
            "A lavish palace garden filled with guests during a royal celebration.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "인어공주의 자매들은 그녀에게 바다 마녀로부터 받은 칼로 왕자를 해치면 자신의 목소리를 되찾고 다시 인어가 될 수 있다고 말합니다. 그러나 인어공주는 왕자를 사랑하여 그를 해칠 수 없습니다.",
        "description_of_illustration":
            "A moonlit beach with a sharp, gleaming knife on the sand.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "인어공주는 왕자와 다른 공주의 결혼식 날, 바다로 돌아가 거품이 되어 사라집니다. 그녀는 자신의 희생을 통해 바다의 일원이 되고, 하늘의 별이 됩니다.",
        "description_of_illustration":
            "The sea at sunrise with gentle waves and a faint trace of foam.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      }
    ]
  },
  {
    "primary_character": "성냥팔이 소녀",
    "scenes": [
      {
        "scene_contents":
            "성냥팔이 소녀는 추운 겨울날에 길 위에 서있습니다. 소녀는 성냥을 하나도 팔지 못하고 길거리를 헤매고 있었어요. 그녀는 얇은 옷을 입고 있어 추위에 떨고 있습니다.",
        "description_of_illustration": "a snowy city street",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "소녀는 조금이라도 추위를 피하기 위해 주위를 둘러봅니다. 소녀는 한 집 앞에 버려진 상자 뒤에 몸을 숨겼어요. 그곳에서 그녀는 첫 번째 성냥을 켰습니다.",
        "description_of_illustration": "a box left in front of the house.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "불꽃을 바라보며, 소녀는 따뜻한 난로 앞에 앉아 있는 상상을 했어요. 약간의 따듯함을 느낀 소녀는 기쁜 마음에 박수를 쳤어요.",
        "description_of_illustration":
            "A bright flame illuminates the girl's hopeful face.",
        "action_used_in_action_list": "박수치기",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "성냥이 점점 타들어가자, 소녀는 다시 추위를 느끼기 시작합니다. 그녀는 두 번째 성냥을 켜고, 맛있는 크리스마스 음식이 가득한 테이블을 상상합니다.",
        "description_of_illustration":
            "lit matches and tables full of Christmas food.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "세 번째 성냥을 켤 때, 소녀는 자신의 할머니와 강아지를 떠올립니다. 그녀의 가족들은 소녀가 기억하는 가장 따뜻하고 사랑스러운 것이었어요.",
        "description_of_illustration":
            "a gracious gray-haired grandmother sitting in a shabby house.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": ["강아지"]
      },
      {
        "scene_contents":
            "소녀는 할머니와 강아지가 자신을 천국으로 데려가 주기를 바라며 네 번째 성냥을 켰어요. 그녀는 할머니, 강아지와 함께 있기를 간절히 원했어요.",
        "description_of_illustration":
            "a gracious gray-haired grandmother smiling in the winter sky.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": ["강아지"]
      },
      {
        "scene_contents":
            "마지막 성냥이 꺼지자, 소녀는 할머니와 강아지를 만났어요. 그녀는 손을 흔들며 달려갑니다. 그녀는 이제 더 이상 추위나 굶주림에 시달리지 않아도 괜찮습니다.",
        "description_of_illustration":
            "The gracious gray-haired grandmother is smiling with a welcoming face.",
        "action_used_in_action_list": "왼손 흔들기",
        "animals_from_animal_list": ["강아지"]
      },
      {
        "scene_contents":
            "다음 날 아침, 사람들은 한 소녀의 몸을 발견합니다. 그녀의 얼굴에는 마지막 순간의 평화와 기쁨이 남아 있습니다.",
        "description_of_illustration":
            "The day after Christmas, villagers are buzzing in front of the box.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      }
    ]
  },
  {
    "primary_character": "도로시",
    "scenes": [
      {
        "scene_contents":
            "도로시와 그녀의 강아지 토토는 시골의 작은 농장에서 살고 있습니다. 갑자기 거대한 토네이도가 그들의 집을 강타하고, 도로시와 토토는 집과 함께 하늘로 솟구쳐 올라갑니다. 도로시가 놀라 양손을 번쩍 들었습니다.",
        "description_of_illustration":
            "A small farmhouse caught in a massive tornado.",
        "action_used_in_action_list": "양손 번쩍",
        "animals_from_animal_list": ["강아지"]
      },
      {
        "scene_contents":
            "토네이도가 잦아들고, 도로시와 강아지 토토는 오즈의 마법 나라에 도착합니다. 그들은 먼치킨 땅에 착륙하고, 먼치킨들과 북쪽의 선한 마녀 글린다를 만납니다.",
        "description_of_illustration":
            "The magical land and the good witch who lives there",
        "action_used_in_action_list": "",
        "animals_from_animal_list": ["강아지"]
      },
      {
        "scene_contents":
            "글린다는 도로시에게 오즈의 마법사를 만나러 에메랄드 시티로 가라고 조언합니다. 그녀는 마법사가 도로시가 고향으로 돌아갈 수 있도록 도와줄 것이라고 말합니다. 도로시를 팔을 흔들며 마녀에게 인사합니다.",
        "description_of_illustration":
            "A sparkling road leading to a distant, emerald-green city.",
        "action_used_in_action_list": "오른손 흔들기",
        "animals_from_animal_list": [""]
      },
      {
        "scene_contents":
            "도로시와 강아지 토토는 노란 벽돌길을 따라 가면서 허수아비, 양철 나무꾼, 겁쟁이 사자를 만납니다. 그들은 모두 자신들의 소원을 이루기 위해 도로시의 여정에 합류합니다.",
        "description_of_illustration":
            "Scarecrow and Tin Woodman Standing on One Side of the Yellow Brick Road.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": ["강아지", "사자"]
      },
      {
        "scene_contents":
            "에메랄드 시티에 도착한 도로시와 친구들, 오즈의 마법사는 그들의 소원을 들어주기 전에 서쪽의 악한 마녀를 물리치라고 요구합니다. 도로시와 그녀의 친구들은 두려움을 무릅쓰고 마녀의 성으로 향하기로 마음을 먹습니다. 도로시는 의지를 불태우며 손을 하늘로 뻗었습니다.",
        "description_of_illustration":
            "A grand gate opening to the magnificent Emerald City.",
        "action_used_in_action_list": "오른손 번쩍",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "도로시가 실수로 물을 마녀에게 쏟아붓게 되고, 마녀는 녹아 없어집니다. 그들은 마녀의 지팡이를 가지고 에메랄드 시티로 돌아와 마법사에게 보고합니다.",
        "description_of_illustration":
            "An evil witch who lives in a dark forest melts away in the water.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": [""]
      },
      {
        "scene_contents":
            "오즈의 마법사는 사실 마법사가 아니었음을 고백합니다. 그는 평범한 사람이었지만, 도로시와 그녀의 친구들의 마음 속에 그들이 원하는 것을 이미 갖고 있음을 깨닫게 해주었어요. 모두는 기쁜 마음에 박수를 쳤습니다.",
        "description_of_illustration":
            "The Scarecrow and the Tin Woodman, who realized that the important thing already exists in the mind, applaud.",
        "action_used_in_action_list": "박수치기",
        "animals_from_animal_list": ["강아지", "사자"]
      },
      {
        "scene_contents":
            "도로시는 빨간 구두의 힘으로 고향으로 돌아갔어요. 한적하지만 화목한 그녀의 집으로 돌아갔습니다. 그녀는 마법 나라에서 배운 경험을 가지고 강아지 토토와 행복하게 살아갑니다.",
        "description_of_illustration": "a quiet but harmonious country house.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": ["강아지"]
      },
    ]
  },
  {
    "primary_character": "양치기 소년",
    "scenes": [
      {
        "scene_contents":
            "양치기 소년은 마을 근처의 언덕에서 양을 몰고 있습니다. 소년은 혼자서 시간을 보내는 것이 지루하게 느껴졌어요. 그때 소년은 재밌는 생각이 떠올라 왼손을 번쩍 올렸어요.",
        "description_of_illustration":
            "A peaceful hillside with a flock of sheep grazing under the sun.",
        "action_used_in_action_list": "왼손 번쩍",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "소년은 마을 사람들에게 장난을 치려는 생각이었어요. 소년은 크게 '늑대가 나타났다! 도와주세요!'라고 외치며 오른손을 흔들었습니다. 마을 사람들은 소년이 큰 위험에 처했다고 생각하고 달려와주었어요.",
        "description_of_illustration":
            "Villagers running up the hill, worried and anxious.",
        "action_used_in_action_list": "오른손 흔들기",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "마을 사람들이 언덕에 도착하자 소년은 크게 웃으며 '거짓말이지롱!'이라고 외칩니다. 마을 사람들은 화가 나지만, 다행히 아무 일도 일어나지 않았기에 다시 마을로 돌아갔어요. 소년은 재밌어서 박수를 치며 깔깔댔어요",
        "description_of_illustration":
            "Angry villagers go down the hill to the village.",
        "action_used_in_action_list": "박수치기",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "며칠 후, 소년은 다시 또 장난을 쳤어요. '정말 늑대가 나타났다! 도와주세요!'라고 외치며 양손을 번쩍 들어올렸어요. 마을 사람들은 다시 한번 그의 구조 요청에 언덕을 올라갔어요.",
        "description_of_illustration":
            "Villagers hesitantly walking up the hill, less hurried than before.",
        "action_used_in_action_list": "양손 번쩍",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "이번에도 소년은 마을 사람들을 속였다고 웃으며 고백했어요. 이제 마을 사람들은 소년의 말을 믿지 않기로 합니다.",
        "description_of_illustration": "the angry look of the villagers.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "어느 날, 진짜 늑대가 양 무리에 나타났어요. 소년은 두려움에 질려 양팔을 번쩍 들고 진심으로 도움을 청하며 소리쳤습니다.",
        "description_of_illustration": "a wolf among a flock of sheep.",
        "action_used_in_action_list": "양손 번쩍",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            " 하지만 이번에는 마을 사람들이 그의 말을 믿지 않았어요. 소년은 혼자서 늑대와 맞서 싸우려 했어요. 하지만, 늑대는 양들을 해치기 시작했고 소년은 무력함을 느끼며 절망에 빠졌습니다. ",
        "description_of_illustration": "a quiet hillside village.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "결국, 마을 사람들이 소년의 절규를 듣고 늦게나마 도착했어요. 그들은 늑대를 쫓아내고, 소년은 자신의 행동을 후회하며 진심으로 사과했습니다. 그러자 마을 사람들이 늑대를 쫓아내주었어요. 소년은 거짓말의 결과를 깨닫고 다시는 거짓말을 하지 않겠다고 다짐하며 오른손을 번쩍 들어올렸어요.",
        "description_of_illustration":
            "Villagers helping to chase the wolf away.",
        "action_used_in_action_list": "오른손 번쩍",
        "animals_from_animal_list": []
      }
    ]
  },
  {
    "primary_character": "임금님",
    "scenes": [
      {
        "scene_contents":
            "어느 왕국에 임금님이 계셨습니다. 이 임금님에게는 아무에게도 말할 수 없는 비밀이 하나 있었습니다. 그의 귀는 당나귀 귀였습니다.",
        "description_of_illustration": "A majestic throne room.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "임금님은 자신의 비밀을 감추기 위해 매일 아침 이발사를 불러 자신의 머리를 다듬게 했습니다. 이발사는 매번 임금님의 귀를 보고도 아무 말도 하지 않았습니다.",
        "description_of_illustration": "a barber shop.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "임금님은 이발사에게 절대로 자신의 귀에 대해 말하지 말라고 오른손을 흔들며 경고했습니다. 이발사는 맹세를 하고 비밀을 지키겠다고 약속했습니다. 하지만 비밀은 그의 마음을 무겁게 짓눌렀습니다.",
        "description_of_illustration":
            "The barber bowing deeply, a look of worry on his face.",
        "action_used_in_action_list": "오른손 흔들기",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "이발사는 결국 비밀을 더 이상 감추지 못하고 숲으로 가서 큰 나무 구멍에 대고 '임금님의 귀는 당나귀 귀입니다'라고 속삭였습니다. 그는 그렇게 하고 나서야 마음이 가벼워졌습니다.",
        "description_of_illustration":
            "a large hollow tree in a dense, secluded forest.",
        "action_used_in_action_list": "양손 번쩍",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "하지만 숲에서 불어온 바람이 이발사의 말을 마을로 퍼뜨렸습니다. 나무를 통해 바람이 말을 듣고, 마을 사람들에게 소문이 퍼지기 시작했습니다.",
        "description_of_illustration": "Leaves rustling in the wind.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "소문은 점점 더 많은 사람들에게 퍼졌고, 결국 임금님의 귀가 당나귀 귀라는 이야기가 온 왕국에 알려지게 되었습니다. 임금님은 이 사실을 알고 양손을 번쩍 들며 크게 당황했습니다.",
        "description_of_illustration":
            "Villagers gossiping in the market square, animated and curious.",
        "action_used_in_action_list": "양손 번쩍",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "임금님은 자신의 비밀이 밝혀진 것을 받아들이고, 결국 왕국 사람들 앞에서 오른손 번쩍을 하며 자신의 귀를 공개했습니다. 사람들은 처음에 놀랐지만, 점차 임금님을 받아들였습니다.",
        "description_of_illustration":
            "Villagers surprise in the market square, animated and curious.",
        "action_used_in_action_list": "오른손 번쩍",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "임금님은 자신의 당나귀 귀를 받아들임으로써 더 겸손하고 지혜로운 통치자가 되었습니다. 왕국 사람들은 그의 용기와 솔직함을 존경하게 되었습니다.",
        "description_of_illustration": "a sacred throne.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      }
    ]
  },
  {
    "primary_character": "피노키오",
    "scenes": [
      {
        "scene_contents":
            "목수 제페토는 나무 인형 피노키오를 만듭니다. 그는 피노키오가 진짜 아이처럼 움직이고 말할 수 있기를 바랍니다. 제페토는 밤에 별에게 소원을 빕니다.",
        "description_of_illustration":
            "A cozy woodshop with Geppetto carving a wooden puppet.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "소원이 이루어져 피노키오는 생명을 얻고 말을 시작합니다. 제페토는 놀라움을 금치 못합니다. 피노키오는 처음으로 걸음마를 시도합니다.",
        "description_of_illustration":
            "a grandfather who is surprised at the woodwork.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "피노키오는 학교에 가기 위해 집을 떠나지만, 원숭이와 코끼리에게 속아 서커스단에 팔려갑니다. 그는 자신의 처지를 슬퍼하며 오른손 흔들기를 하며 도움을 청합니다.",
        "description_of_illustration": "a quiet road in the village.",
        "action_used_in_action_list": "오른손 흔들기",
        "animals_from_animal_list": ["원숭이", "코끼리"]
      },
      {
        "scene_contents":
            "서커스에서 피노키오는 공연을 하며 다양한 트릭을 배웁니다. 하지만 그는 여전히 자유를 갈망하며 집으로 돌아가기를 원합니다.",
        "description_of_illustration": "a circus venue.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "피노키오는 결국 도망쳐 동화 나라로 향합니다. 그 곳에서는 아이들이 하루 종일 놀기만 해도 된다고 합니다. 그러나 그곳은 사실 아이들을 나귀로 변하게 하는 함정이었습니다.",
        "description_of_illustration": "a fantasy land in a fairy tale.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "피노키오는 나귀 귀가 자라나기 시작하는 것을 발견하고 공포에 휩싸입니다. 그는 진정한 자신을 찾기 위해 도망칩니다.",
        "description_of_illustration": "a fantasy land in a fairy tale.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "피노키오는 바다로 도망치다 거대한 고래에게 삼켜집니다. 그 안에서 그는 제페토를 만나고, 두 사람은 함께 탈출 계획을 세웁니다.",
        "description_of_illustration": "the belly of a whale.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "피노키오와 제페토는 성공적으로 고래를 탈출하고, 피노키오는 용기와 희생의 행동으로 인해 진짜 소년이 됩니다. 그는 제페토와 행복하게 살아갑니다.",
        "description_of_illustration":
            "A happy grandfather is at the carpentry.",
        "action_used_in_action_list": "양손 번쩍",
        "animals_from_animal_list": []
      }
    ]
  },
  {
    "primary_character": "농부",
    "scenes": [
      {
        "scene_contents":
            "한 가난한 농부가 숲에서 거위를 발견했습니다. 그는 거위를 집으로 데려가 돌보기로 결심했습니다. 농부는 거위가 특별해 보이길 바랐지만, 특별한 점을 발견하지 못했습니다.",
        "description_of_illustration": "A simple farmhouse.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "어느 날 아침, 농부는 거위가 황금 달걀를 낳은 것을 발견했습니다. 그는 놀라움과 기쁨을 감추지 못했습니다. 농부는 이 달걀을 팔아 가난에서 벗어날 수 있을 것이라고 생각했습니다.",
        "description_of_illustration":
            "A shiny golden egg nestled among regular eggs in a nest.",
        "action_used_in_action_list": "양손 번쩍",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "이후로 거위는 매일 황금 달걀를 하나씩 낳았습니다. 농부는 점점 더 부자가 되었고, 많은 사람들이 그의 부를 부러워했습니다. 하지만 그 부는 농부의 욕심을 더욱 자극했습니다.",
        "description_of_illustration":
            "A shiny golden egg nestled among regular eggs in a nest.",
        "action_used_in_action_list": "박수치기",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "농부는 자신의 욕심을 충족시키기 위해 더 많은 황금 달걀을 얻고자 거위를 과도하게 돌보기 시작했습니다. 그는 거위에게 특별한 먹이를 주고, 거위의 건강을 지나치게 걱정하기 시작했습니다.",
        "description_of_illustration": "Happy Goose in the Nest.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "거위는 불안해하며 황금 달걀 낳기를 멈추었습니다. 농부는 불안과 화를 느끼며 자신의 행동을 후회하기 시작했습니다.",
        "description_of_illustration":
            "The goose looking distressed and not laying any eggs.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "농부는 결국 욕심을 이기지 못하고 거위의 배를 갈라 그 안에 더 많은 달걀이 있는지 확인하려 했습니다. 그는 단검을 들고 거위에게 다가갔습니다.",
        "description_of_illustration": "a goose whose stomach is splitting.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "농부의 욕심으로 인해 거위는 죽고 말았습니다. 그의 손에는 아무것도 남지 않았습니다. 황금 달걀도, 거위도, 그의 행복도 모두 사라졌습니다.",
        "description_of_illustration":
            "The dead goose lying on the ground, no golden eggs to be found.",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      },
      {
        "scene_contents":
            "농부는 자신의 행동을 후회하며 무너진 채 앉아 있었습니다. 그는 자신의 욕심이 가져온 결과를 깨닫고, 다시는 그런 실수를 반복하지 않겠다고 다짐했습니다.",
        "description_of_illustration": "an empty nest in an old barn",
        "action_used_in_action_list": "",
        "animals_from_animal_list": []
      }
    ]
  }
];
