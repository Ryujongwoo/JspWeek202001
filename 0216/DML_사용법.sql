# INSERT INTO 테이블이름 (필드이름, ...) VALUES (데이터, ...);
# 문자열 데이터는 반드시 작은따옴표로 묶어준다.
INSERT INTO memolist (NAME, PASSWORD, memo) VALUES ('홍길동', '1111', '1등 입니다.');
INSERT INTO memolist (NAME, PASSWORD, memo) VALUES ('임꺽정', '2222', '2등 입니다.');
INSERT INTO memolist (NAME, PASSWORD, memo) VALUES ('장길산', '3333', '3등 입니다.');
INSERT INTO memolist (NAME, PASSWORD, memo) VALUES ('일지매', '4444', '4등 입니다.');

# SELECT [DISTINCT]필드이름, ... FROM 테이블이름;
# DISTINCT => 중복되는 데이터는 1번씩만 출력한다.
SELECT DISTINCT NAME, PASSWORD FROM memolist;
# 필드 이름에 '*'을 입력하면 모든 필드를 출력한다.
SELECT * FROM memolist;
# SELECT * FROM 테이블이름 [ORDER BY 필드이름 [ASC/DESC]];
# ORDER BY => 정렬, ASC => 오름차순 정렬(기본값). DESC => 내림차순 정렬
SELECT * FROM memolist ORDER BY idx DESC;
# SELECT * FROM 테이블이름 [WHERE 조건식];
# 단순 조건
SELECT * FROM memolist WHERE NAME = '홍길동'; # 같다는 '='를 1번만 써야한다.
SELECT * FROM memolist WHERE NAME != '홍길동'; # 같지 않다.
SELECT * FROM memolist WHERE NAME <> '임꺽정'; # 같지 않다.
SELECT * FROM memolist WHERE idx >= 3;
# OR 조건
SELECT * FROM memolist WHERE NAME = '홍길동' || NAME = '임꺽정';
SELECT * FROM memolist WHERE NAME = '장길산' OR NAME = '일지매';
# IN 연산자와 NOT IN 연산자를 사용해서 OR 조건 지정하기
SELECT * FROM memolist WHERE NAME IN ('홍길동', '임꺽정', '장길산');
SELECT * FROM memolist WHERE NAME NOT IN ('홍길동', '임꺽정', '장길산');
# AND 조건
SELECT * FROM memolist WHERE idx >= 3 && idx <= 6;
SELECT * FROM memolist WHERE idx >= 4 AND idx <= 5;
# BETWEEN 연산자를 사용해서 AND 조건을 지정할 수 있다. => 이상, 이하 조건만 가능하다.
SELECT * FROM memolist WHERE idx BETWEEN 3 AND 6;
# LIKE 연산자와 와일드 카드(대체) 문자를 사용해서 부분일치 조건 지정하기
# 와일드 카드 문자 : '%' => 여러문자, '_' => 1문자
SELECT * FROM memolist WHERE NAME LIKE '_길_';  # 3글자 이고 가운데 글자가 '길'인
SELECT * FROM memolist WHERE NAME LIKE '홍%';   # '홍'으로 시작하는
SELECT * FROM memolist WHERE NAME LIKE '%산';   # '산'으로 끝나는
SELECT * FROM memolist WHERE NAME LIKE '%길%';  # '길'을 포함하는
# 그룹 함수 : SUM(합계), AVG(평균), MAX(최대값), MIN(최소값), COUNT(개수)
SELECT SUM(idx) FROM memolist;
SELECT AVG(idx) FROM memolist;
SELECT MAX(idx) FROM memolist;
SELECT MIN(idx) FROM memolist;
# 개수는 어떤 열의 개수를 세도 결과가 같기 때문에 인수로 필드 이름을 쓰지 않고 '*'을 주로 사용한다.
SELECT COUNT(*) FROM memolist;
# SELECT * FROM 테이블이름 [GROUP BY 필드이름 [HAVING 조건식]];
# WHERE는 SELECT 문장의 전체 조건이고 HAVING은 GROUP 조건이다.
SELECT NAME, SUM(idx) FROM memolist GROUP BY NAME;
SELECT NAME, SUM(idx) FROM memolist GROUP BY NAME HAVING NAME LIKE '%길%';
# SELECT * FROM 테이블이름 [LIMIT 시작인덱스번호, 개수];
# 검색된 결과에서 지정된 인덱스 번호 부터 지정된 개수 만큼 데이터를 얻어온다.
# 인덱스는 SELECT 명령 실행 결과의 첫 번째 데이터의 인덱스가 0이고 다음 부터는 1씩 증가한다.
# 오라클은 인덱스가 0이 아닌 1 부터 시작됨에 주의를 요한다.
SELECT * FROM memolist ORDER BY idx DESC LIMIT 2, 4;

# ==============================================================================================================
# SELECT * FROM memolist ORDER BY idx DESC LIMIT 2, 4; # 지정된 범위의 레코드를 얻어온다.
# SELECT * FROM memolist WHERE idx = 3; # 조건을 만족하는 특정 레코드를 얻어온다.
# SELECT * FROM memolist WHERE NAME LIKE '%길%'; # 특정 검색어를 포함하는 레코드 얻어온다.
# SELECT COUNT(*) FROM memolist; # 테이블에 저장된 전체 레코드의 개수를 얻어온다.
# ==============================================================================================================

# DELETE FROM 테이블이름 [WHERE 조건식];
# 조건식을 지정하지 않으면 테이블에 저장된 모든 데이터가 제거된다.
DELETE FROM memolist WHERE idx = 5;

# 자동증가 일련번호 1부터 다시 시작하기
# 테이블에 저장된 모든 레코드를 삭제하고 아래의 명령을 실행한다.
DELETE FROM memolist;
ALTER TABLE memolist AUTO_INCREMENT = 1;

# UPDATE 테이블이름 SET 수정할내용, ... [WHERE 조건식];
# 조건식을 지정하지 않으면 테이블에 저장된 모든 데이터가 수정된다.
UPDATE memolist SET PASSWORD = '5555';
UPDATE memolist SET PASSWORD = '1111' WHERE NAME = '홍길동';

SELECT * FROM memolist ORDER BY idx DESC;