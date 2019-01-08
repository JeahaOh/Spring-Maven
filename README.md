# Spring-Maven
Maven을 이용한 Spring Study

- - -
## 회사에서 sts를 사용하니 sts도 깔아보도록 하자
https://spring.io/tools

- [new]-[others]-[Spring]-[Spring Legacy Project]
    - Templates에서 Spring MVC Project 선택
(여기까지 엄청 헤맸음... 딮빡...)
(참고 https://hanazuou.tistory.com/158 )
- - -
## Maven 설치와 환경변수 잡기

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

