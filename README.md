# Spring-Maven
Maven을 이용한 Spring Study

- - -

## 19.01.09 설정 잡기...
    Gradle과 Maven으로 build한 Spring의 구조가 달라서? 인지 뭐가 뭔지 잘 모르겠음...
    일단 책을 사도록 하자...

## 19.01.08 회사에서 sts를 사용하니 sts를 사용해 보도록 하자.
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

