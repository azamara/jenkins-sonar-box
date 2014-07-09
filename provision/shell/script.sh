# 오픈 소스의 최신 버전 설치를 위해 apt-repository에 등록
## add-apt-repository를 사용하기 위한 패키지 설치
## -y 옵션은 질문에 대한 답변을 자동적으로 y로 지정한다.
apt-get update
apt-get install -y python-software-properties

## Oracle Java
add-apt-repository -y ppa:webupd8team/java

## Maven 3
add-apt-repository -y ppa:natecarlson/maven3

## Jenkins
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list

## Sonar
echo deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/ > /etc/apt/sources.list.d/sonar.list

## 저장소 업데이트
apt-get update

# 패키지 설치
## Java 설치
cp /vagrant/provision/shell/.bashrc /home/vagrant

## Maven 설치
apt-get install -y maven

## MySQL 설치
echo "mysql-server mysql-server/root_password password 1234" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password 1234" | debconf-set-selections
apt-get install -y mysql-server
### MySQL 외부 접근이 가능한 설정 파일로 교체
cp /vagrant/provision/shell/mysql/my.cnf /etc/mysql/
### 사용자 및 스키마 생성
mysql -u root -p1234 --default-character-set=utf8 < /vagrant/provision/shell/mysql/schema.sql
service mysql restart

## Git 설치
apt-get install -y git

## Jenkins 설치
apt-get install -y jenkins

## Sonar 설치
apt-get install --force-yes -y sonar
cp /vagrant/provision/shell/sonar/sonar.properties  /opt/sonar/conf/
update-rc.d sonar defaults

# 버전 확인
echo "java 버전" && java -version
echo "maven 버전" && mvn -v
echo "mysql 버전" && mysql --version

## 로케일 변경
apt-get install -y language-pack-ko
locale-gen ko_KR.UTF-8
dpkg-reconfigure locales
cp /vagrant/provision/shell/locale /etc/default/
