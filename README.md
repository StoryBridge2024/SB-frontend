# SB-frontend

# How to Setup
## dotenv
1. 최상위 디렉토리에 '.env'파일 생성
2. 디스코드 Settings 채널에 올려둔 내용을 위 파일에 기입

- **주의** 
    - dotenv파일에는 apiKey처럼 공개되면 안되는 내용이 들어가는거라 github에 올라가면 안됌
    - push하기 전에 항상 dotenv파일 올라가지 않는지 확인하기

# 가이드라인

## 브랜치 전략

### 작업 순서

- 평소
    1. `develop`에서 `feature/~` 브랜치 생성 후 작업
    2. 로컬 테스트 후 이상 없을 시 `develop`으로 PR
    3. 상호 코드 리뷰
    4. `Approve`시 `develop`에 merge
    5. 어느 정도 커밋이 쌓이면 `develop`에서 `release/<version>` 브랜치 생성
    6. QA 진행, 수정사항 발생 시 해당 release 브랜치에서 작업 후 commit
    7. 모든 테스트 완료 후 `main`으로 merge 및 배포
- 긴급 수정(hotfix)
    1. 관리자에게 연락
    2. `main`에서 `hotfix`브랜치 생성 후 작업
    3. 로컬 테스트 후 `main` 으로 PR
    4. 관리자 확인 후 `merge`

### Git 사용하기

- Branch Usage
    - Repository name should be like following format
        - `feature/<issue_number>`
        - `feature/<feature_name>`
        - `release/<version_number>`
        - `hotfix/<issue_number>`
- Commit Message
    - Commit with the smallest change unit
    - Use category in commit messages
        - `int`: only for initial commit
        - `doc`: changes document or comment
        - `ftr`: add new feature
        - `mod`: modify existing feature
        - `fix`: fix an error or issue
        - `rfc`: refactor code
        - `add`: add new file or directory
        - `rmv`: remove existing file or directory
    - Example
        - `int: initial commit`

## 코딩 컨벤션

- 웬만하면 따를 것

### 1. 네이밍

- 변수 이름은 길어도 괜찮으니 필요한 내용은 다 담아주세요.
- boolean 변수는 `is~` 로 시작
    - MediaQuery Breakpoints
    `isNotMobile`(sm), `isNotTablet`(md), `isNotDesktop`(lg)
- 이벤트 핸들러 함수는 `‘handle’ + ElementName + EventType` 으로 해주세요.
    - 예시
        - `handleAddButtonClick`
        - `handleMemberSelectedChange`
- 함수 이름은 동사로 시작합니다.
- 배열 변수 이름
    - numbers : 배열의 원소들이 number
    - numberArray : 배열의 이름이 **number**
    - 대부분의 상황에서는 -s 를 붙인 복수형 명사를 사용하시게 됩니다.
- 페이지 컴포넌트 변수명은 끝에 `Page`를 붙인다.
    - ex. `MigrationPage`

### 2. 파일, 폴더 이름

- 컴포넌트는 `PascalCase`, 나머지 util 함수는 `camelCase`
- 대부분의 상황에서 `~.ts`는 소문자, `~.tsx`는 대문자입니다.

### 3. 컴포넌트 구현

- 코드 순서
    - useState, useRef 등의 hooks
    - useEffect
    - handler
    - return
- 굳이 다른 파일로 빼지 않아도 될 컴포넌트는 export할 컴포넌트의 아래에 둡니다.

### 4. 파일 경로

- 절대 경로 사용(상대 경로 사용 금지)

### 5. 상수 하드코딩 지양

- 상수는 data 폴더에 둡니다.
- 상수 변수명은 대문자 스네이크 표기법(`NUM_QUESTIONS`)을 사용합니다.
- 여기서 상수란 아래와 같은 것들이 있습니다.
    - 시스템 상수
        - 동아리 지원서 질문 갯수
    - 에러 메세지
        - `const API_RESPONSE_ERROR_MESSEGE = “서버에 문제가 생긴 것 같아요”`
    - 각종 데이터
        - `const CATEGORIES = ['정치/사회', '종교', '봉사', '순수과학', 'IT/공학', '예체능', 'STUDY']`
    - 경로

### 6. 함수는 화살표 함수(arrow function) 사용

- `function` 키워드는 사용을 자제해주세요.

### 7. interface vs. type

- 객체 타입은 `interface`, 나머지는 type 키워드 사용
- [참고 문서](https://www.typescriptlang.org/docs/handbook/2/everyday-types.html#differences-between-type-aliases-and-interfaces)

### 8. Type은 가능한 좁히면 좋습니다.

- 단순히 string, number보다 `type Semester = `${'SPRING' | 'FALL'}${number}`` 가 좋습니다.
- [참고 문서](https://www.typescriptlang.org/docs/handbook/2/narrowing.html)

### 9. 이벤트 핸들러의 이벤트 객체 타입을 지정해주세요.

- 이벤트 핸들러는 아래 예시처럼 선언하시면 됩니다.
    - `const handleElementClick: React.MouseEventHandler<HTMLButtonElement> = (e) => {…}`
- MUI 컴포넌트 중 일부는 리액트에서 제공하는 이벤트 타입이 아닌, 자체 커스텀 이벤트 타입을 가지는 것이 있습니다. 아래 예시처럼 작성하시면 됩니다.
    
    ```
    // MUI TextField의 경우 event 객체의 타입은 아래와 같습니다.
    
    const handleChange = (
        event: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement> | SelectChangeEvent<string>
      ):void => {...}
    ```
    

### 10. API Response Type 반드시 작성해주세요.

- API Response Type은  API 호출하는 함수 바로 위에 작성해주세요.
    - 이 함수는 컴포넌트 안이 아니라, 다른 코드에 작성되어 있어야 합니다.

### 11. 반드시 모든 타입을 달 필요는 없습니다.

- TS 컴파일러가 충분히 추론 가능할 경우 달지 않아도 됩니다.
- [참고 문서](https://www.typescriptlang.org/docs/handbook/type-inference.html#handbook-content)

### 11. 기타

- eslint, prettier 설정을 따릅니다.
- 애매하면 최대한 strict하게 짜시면 됩니다.
