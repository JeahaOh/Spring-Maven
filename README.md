# Spring-Maven
Maven을 이용한 Spring Study

- - -
## 19.01.12 스프링 주요 특징
- POJO (Plain Old Java Object) : 별도의 API가 필요하지 않은 일반적인 자바코드를 이용하여 개발 가능.
- 의존성 주입(DI)를 통한 객체간의 관계 구성.
- AOP(Aspect Oriented Programming) 지원 : 반복적인 코드를 줄이고, 개발자가 비지니스 로직에만 집중 할 수 있도록 지원.
- 편리한 MVC구조.
- WAS에 종속적이지 않은 개발 환경

1) IoC (Inversion of Control) - 객체에 대한 제어권.
    - new를 통한 객체 제어권을 스프링에게 넘김.
    - 따라서 instance의 라이프 사이클(생성-소멸)을 개발자가 아닌 스프링 프레임웤이 담당.
2) DI (Dependency Injection) - 의존관계 주입.
    - 객체 간의 의존성을 개발자가 설정하는 것이 아닌 스프링 컨테이너가 주입 시켜 주는 기능.
    - 객체 확장과 재 사용성 증대.
    - 의존관계?
        - 강한 결합은 유지 보수와 재활용을 힘들게 함.
        - 따라서 낮은 결합과 높은 응집도로 코딩해야함.

## 19.01.12 Maven Spring 구조
    |- src/main/java            - 자바코드 디렉토리.(Controller, Model, Service)
    |- src/main/resources       - 자바 코드에서 참조하는 리소스 디렉토리.
    |    |- /mybatis-Config.xml, (mybatis의)mapper.xml
    |- src/test/java            - 테스트 관련 코드 디렉토리.
    |- src/test/resources       - 테스트 코드에서 참조하는 리소스 파일들 디렉토리.
    |- src/main/webapp          - 웹 서비스 루트 디렉토리.(외부에서 접근하는 곳.)
    |           |-  /resources  - js, css, image 등의 웹 리소스 파일들 디렉토리.
    |           |-  /WEB-INF    - 외부에서 접근 불가능, Controller를 통해 접근함. (jsp를 접근 하더라도.)
    |                   |-  /classes    - 컴파일된 클래스들 디렉토리.
    |                   |-  /spring     - spring 환경 설정 파일들 디렉토리.
    |                   |       |-  /appServlet/servlet-context.xml - 서블릿과 관련된 리소스에 대한 설정.
    |                   |       |-  /root-context.xml   - 서블릿과 관련되지 않은 모든 리소스에 대한 설정.
    |                   |-  /views      - html, jsp 디렉토리.
    |-  pom.xml                 - 메이븐에서 참조하는 설정파일.
    
    *Spring : 셋팅이 반을 먹고 들어감...*

- - -
## 19.01.09 설정 잡기...
    Gradle과 Maven으로 build한 Spring의 구조가 달라서? 인지 뭐가 뭔지 잘 모르겠음...
    일단 책을 사도록 하자...

## 19.01.08 현업에서 sts를 사용한다고 하니 sts를 사용해 보도록 하자.
https://spring.io/tools

- [new]-[others]-[Spring]-[Spring Legacy Project]
    - Templates에서 Spring MVC Project 선택
(여기까지 엄청 헤맸음... 딮빡...)
(참고 https://hanazuou.tistory.com/158 )
- - -
## 19.01.08 Maven 설치와 환경변수 잡기

- terminal
    - brew install maven
        - mvn -version
    - sudo vi ~/.bash_profile
        - export M2_HOME=/usr/local/Cellar/maven/3.6.0/libexec
            - (설치 경로와 버젼을 확인하고 잡아줘야함.)
        - export M2=$M2_HOME/bin
        - export PATH=$PATH:$M2_HOME/bin
    - source .bash_profile
    - 확인하기
        - ➜  ~ echo ${M2_HOME}
        - /usr/local/Cellar/maven/3.6.0/libexec
        - ➜  ~ echo ${M2}
        - /usr/local/Cellar/maven/3.6.0/libexec/bin

