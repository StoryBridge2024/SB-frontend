# Story Bridge

> 기간: 2024.02 ~ ing  
> 소속: 중앙대학교 소프트웨어학부  
> 교과목: 캡스톤디자인(2)

2024-2 중앙대학교 소프트웨어학부 캡스톤디자인(2) Story Bridge 입니다.

Story Bridge는 생성형 AI를 이용하여 아이에게 맞춤형 동화를 제작해 주는 서비스입니다. 부모가 아이에게 전달하고자 하는 메시지를 입력하면, 그와 연관된 동화를 제공합니다. 아이는 동화 속 캐릭터로 등장해 움직일 수 있으며, 동화 속 미션을 클리어하면 이야기가 전개됩니다.

## 팀원 및 역할

소프트웨어학부 20223908 김주영

소프트웨어학부 20225215 이해승

소프트웨어학부 20223086 최예진

## 목적

전두엽이 미성숙한 아이들은 강제적인 학습에 어려움을 느낄 수 있습니다.
최근 아이들에게 친근한 동화를 활용한 여러 서비스가 제공되는 추세입니다.
이러한 서비스들은 아이들의 관심을 유발하며 학습 내용을 자연스럽게 익히도록 유도할 수 있습니다.
이에 스토리 브릿지는 부모님이 전하고자 하는 메시지를 동화라는 요소를 이용해 아이들에게 전해주고자 합니다.
특히 아이들의 집중력을 높여주고 정서적인 측면에 긍정적인 영향을 미칠 수 있는 참여형 요소를 추가하였습니다.

## 서비스 흐름

![image](https://github.com/StoryBridge2024/Story-bridge/assets/163294595/6a45381d-4cb1-4cde-b75f-da75c4dd42b9)

## 핵심 기능

1. **동화 생성**

   - 사용자는 원하는 동화 주제를 입력하고 이를 토대로 LLM을 통해 동화 내용과 삽화를 생성합니다.

   > GPT를 통해 장면별로 동화 내용, 해당 장면에 필요한 삽화에 대한 설명, 등장인물 등 각종 메타데이타를 함께 생성해줍니다.  
   > 이후 Dall-E를 통해 장면별로 삽화를 생성합니다.

2. **주인공 캐릭터 제작**

   - 아이의 얼굴 사진을 찍어 캐릭터의 얼굴을 만듭니다.
   - 아이가 직접 그림을 그려 캐릭터의 몸을 만듭니다.

   > 그린 몸 그림을 사람 틀 크기에 맞게 몸통, 관절을 기준으로 왼팔 두 부분, 오른팔 두 부분, 왼쪽 다리 두 부분, 오른쪽 다리 두 부분으로 나눕니다.

3. **미션**

   - 보다 동적인 사용자 경험을 이끌어내기 위해 참여형 요소인 미션 기능을 도입하였습니다.
   - 동화의 일부 장면에 미션이 포함되어 있어, 미션을 통과해야 스탬프가 찍히고 효과음이 나옵니다.
   - 제시된 미션(ex. _오른손 흔들기_, _양손 번쩍_, _박수 치기_, ...)을 하면 미션을 통과할 수 있습니다.
   - 미션을 어려워하는 아이의 경우, 동화 페이지를 클릭해 다음 페이지로 넘어갈 수 있습니다.

   > 미디어파이프를 통해 사용자의 행동을 추적하며, 동화 주인공에 사용자의 행동을 대입합니다.

4. **저장된 동화 다시보기**

   - 봤던 동화를 다시 보기 원하는 사용자를 위해, 만들었던 동화의 내용과 삽화를 다시 볼 수 있게 하였습니다.

   > SQL Lite를 통해 동화 내용과 삽화, TTS를 저장해두고 다시 불러올 수 있습니다.

## 요구사항

- apk실행
   > device OS: only android  
   > android version - v17

- 개발환경

   > Android API 34  
   > Flutter 3.22.2  
   > Dart SDK 3.4.3  
   > Android Studio 2023.3.1  

## 실행

1. download `.apk` file on android device
2. install _story bridge_ application
3. start story bridge

## 데모영상

[Youtube 데모 영상](https://youtu.be/jtCZxolFO4g): 아이들이 어플을 사용하는 장면을 녹화한 영상입니다.

## 개발환경

### 프레임워크

![flutter](https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![dart](https://img.shields.io/badge/dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

### 데이타베이스

![sqlite](https://img.shields.io/badge/sqlite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)

### IDE

![androidstudio](https://img.shields.io/badge/androidstudio-3DDC84.svg?style=for-the-badge&logo=androidstudio&logoColor=white)

### OS

![windows10](https://img.shields.io/badge/windows10-0078D6.svg?style=for-the-badge&logo=windows10&logoColor=white)
![ubuntu](https://img.shields.io/badge/ubuntu-E95420.svg?style=for-the-badge&logo=ubuntu&logoColor=white)

### Device

![android](https://img.shields.io/badge/android-34A853.svg?style=for-the-badge&logo=android&logoColor=white)

## 개발 환경 설정

1. install _android studio_, _flutter_
2. git clone

   ```git
   git clone https://github.com/StoryBridge2024/SB-frontend
   ```

3. open repository as project on android studio
4. add `.env` file on root of directory

   ```
   OPENAI_APIKEY=<Your Openai api key>
   ```

5. select emulator
6. run main.dart
