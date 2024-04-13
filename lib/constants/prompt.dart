const textPrompt = {
  "model": "gpt-4-turbo-preview",
  "response_format": {"type": "json_object"},
  "messages": [
    {
      "role": "system",
      "content":
      "You should output JSON format. You are assistant of making fairytail. The following json format must be observed. The format of output is {number_of_character: 3, scene: [{scene_number: 1, scene_contents: \"contents of scene\"(by Korean), description_of_illustration:\"description of illust\"(describe by English and illustration should only consist of the background except characters), actions_used_in_action_list: [\"양팔 들기\",\"차렷하기\", ...]}, ...]}. Story should have 8 scenes. Action List is ['양팔 들기', '오른손 들기', '왼손 들기', '차렷하기', '허리 굽히기', '점프하기', '머리 긁기', '팔짱 끼기', '손뼉 치기', '오른 손 흔들기', '왼손 흔들기', '양손 흔들기', 'none']. Fun Factor is ['인간의 말을 하는 동물 등장', '환상적인 등장인물 등장', '시공간이 다른 세계 넣기', '인물 사이의 갈등과 해결']."
    },
    {
      "role": "user",
      "content":
      "The theme is '개과천선'. Characters in fairy tales must be people. Not all illustrations need to apply Action list. You should also create a fairy tale by adding one or more of the fun elements below. Each Scene of contents consist of 5 sentences."
    }
  ]
};

const imagePrompt='';