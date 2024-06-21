# Story Bridge
> 기간: 2024.02 ~ ing  
> 소속: 중앙대학교 소프트웨어학부  
> 교과목: 캡스톤디자인(2)

2024-2 중앙대학교 소프트웨어학부 캡스톤디자인(2) Story Bridge 과제입니다.

Story Bridge는 생성형 AI를 이용하여 아이에게 맞춤형 동화를 제작해 주는 서비스입니다. 부모가 아이에게 전달하고자 하는 메시지를 입력하면, 그와 연관된 동화를 제공합니다. 아이는 동화 속 캐릭터로 등장해 움직일 수 있으며, 동화 속 미션을 클리어하면 이야기가 전개됩니다.

## 팀원 및 역할
소프트웨어학부 20223908 김주영

소프트웨어학부 20225215 이해승

소프트웨어학부 20223086 최예진

## 핵심 기능

1. **동화 생성**

    - 사용자는 원하는 동화 주제를 입력하고 이를 토대로 LLM을 통해 동화 내용과 삽화를 생성합니다.

    > GPT를 통해 장면별로 동화 내용, 해당 장면에 필요한 삽화에 대한 설명, 등장인물 등 각종 메타데이타를 함께 생성해줍니다.  
    > 이후 Dall-E를 통해 장면별로 삽화를 생성합니다.

2. **주인공 캐릭터 제작**

    - 

3. **미션**

    - 보다 동적인 사용자 경험을 이끌어내기 위해 미션 기능을 도입하였다.
    - 동화의 일부 장면에 미션이 포함되어있어, 미션을 통과해야 다음 장면을 이어서 열람할 수 있다.
    - 제시된 행동(ex. *오른손 흔들기*, *양손 번쩍*, *박수 치기*, ...)을 하면 미션을 통과할 수 있다.
    - 
    
    > 구현사항: 미디어파이프를 통해 사용자의 행동을 추적하며, 동화 주인공에 사용자의 행동을 대입한다.

4. **세 번째**

## 실행

1. download `.apk` file on android device
2. install *story bridge* application
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

## 개발 환경 설정

1. install *android studio*, *flutter*
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
