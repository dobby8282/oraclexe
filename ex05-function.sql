/*
���ϸ�: ex05-function.sql

�Լ�(Function)
    �Ű�����(����)�� �޾� Ư�� ���(�۾�)�� �����ϰ� ����� ��ȯ�ϴ� ������ �Ǿ��ִ�.

�Լ� ����
    ������ �Լ�  - ������ �Ű������� �޾� ��� �� ��ȯ
    ������(�׷�) �Լ�  - ������ �Ű������� �޾� ��� �� ��ȯ

*/

-- ������ �Լ�

-- ��ҹ��� ��ȯ �Լ�
-- LOWER() �Լ� - ���ڿ��� �ҹ��ڷ� ��ȯ
SELECT employee_id, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'higgins';

-- UPPER() �Լ� - ���ڿ��� �빮�ڷ� ��ȯ
SELECT UPPER('higgins') FROM dual;

-- INITCAP() �Լ� - ���ڿ��� ù ���ڸ� �빮�ڷ� ��ȯ
SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = INITCAP('higgins');


-- ���� ���� �Լ�
-- CONCAT() �Լ� - �� ���� �Ķ���� ���� �����մϴ�.
SELECT 'Hello' || 'World' FROM dual;
SELECT CONCAT('Hello', 'World') FROM dual;

-- SUBSTR() - ������ ������ ���ڿ� �����մϴ�.
SELECT SUBSTR('HelloWorld', 1, 5) FROM dual;

-- LENGTH() - ���ڿ��� ���̸� ���� ������ ǥ���մϴ�.
SELECT LENGTH('HelloWorld') FROM dual;

-- INSTR() - ���ڿ����� ������ ������ ��ġ�� ã���ϴ�.
SELECT INSTR('HelloWorld', 'W') FROM dual;

-- LPAD() - ���ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ�մϴ�.
SELECT LPAD('salary', 10, '*') FROM dual;

-- RPAD() - �����ʺ��� ���ڽ����� ä�� ǥ������ ��ȯ�մϴ�.
SELECT RPAD('salary', 10, '*') FROM dual;

-- REPLACE() - ���ڿ����� ������ ���ڸ� ġȯ�մϴ�.
SELECT REPLACE('JACK and JUE', 'J', 'BL') FROM dual;

-- TRIM() - ���ڿ����� ���� �Ǵ� ���� ���ڸ� �ڸ��ϴ�.
SELECT TRIM('H' FROM 'HelloWorld') FROM dual;

SELECT TRIM(' ' FROM ' HelloWorld ') FROM dual;

-- ���� �Լ�
-- ROUND() - ������ �Ҽ��� �ڸ����� ���� �ݿø��մϴ�.
SELECT ROUND(45.926, 2) FROM dual;

-- TRUNC() - ������ �Ҽ��� �ڸ����� ���� �����մϴ�.
SELECT TRUNC(45.926, 2) FROM dual;

-- MOD() - ���� �������� ��ȯ�մϴ�.
SELECT MOD(1600, 300) FROM dual;

-- CEIL() - �־��� ���ڸ� �ø��Ͽ� ������ ��ȯ�մϴ�.
SELECT CEIL(45.2) FROM dual;


-- ��¥ �Լ�

-- SYSDATE - ���� ��¥�� �ð��� ������ �ִ� pseudo-column 
SELECT SYSDATE FROM dual;

/*
��¥ ����
    ��¥�� ���ڸ� ���ϰų� ���� ��� ��¥ ���� ���մϴ�.
    �� ��¥ ������ �ϼ��� �˾Ƴ��� ���� ���⿬���� �մϴ�.
*/
SELECT last_name, (sysdate - hire_date) / 7 AS WEEKS
FROM  employees
WHERE department_id = 90;

/*
��¥ ���� �Լ�
    MONTHS_BETWEEN(date1, date2) : �� ��¥ ���� �� ���� ����մϴ�.
    ADD_MONTHS(date, n) : ��¥�� n������ �߰��մϴ�.
    NEXT_DAY(date, day_of_week) : ������ ��¥�� �������� �־��� ������ ������ ��¥�� ����մϴ�. 
                                 (1:�Ͽ��� ~ 7:�����)
    LAST_DAY(date) : �־��� ���� ������ ��¥�� ��ȯ�մϴ�.
    ROUND(date, format) : ��¥�� ������ �������� �ݿø��մϴ�.
    TRUNC(date, format) : ��¥�� ������ �������� �����մϴ�.
*/
SELECT MONTHS_BETWEEN(TO_DATE('2017-12-22', 'YYYY-MM-DD'), TO_DATE('2017-05-22', 'YYYY-MM-DD')) FROM dual;
SELECT ADD_MONTHS(TO_DATE('2022-12-16', 'YYYY-MM-DD'), 1) FROM dual;
SELECT NEXT_DAY(TO_DATE('2023-08-05', 'YYYY-MM-DD'), 7) FROM dual;
SELECT LAST_DAY(SYSDATE) FROM dual;
SELECT ROUND(TO_DATE('2023-08-16', 'YYYY-MM-DD'), 'MONTH') FROM dual;
SELECT TRUNC(SYSDATE, 'MONTH') FROM dual;

-- ��ȯ �Լ�
/*
TO_CHAR() �Լ� - ��¥ �Ǵ� ���ڸ� ���ڿ��� ��ȯ

    YYYY - ��ü ������ ���ڷ� ��Ÿ���ϴ�.
    YEAR - ���� ö�ڷ� ǥ��� ������ ��ȯ�մϴ�.
    MM - ���� 2�ڸ� ���� ���� ��ȯ�մϴ�.
    MONTH - ��ü �� �̸��� ��ȯ�մϴ�.
    MON - ���� 3�ڸ� �� ��ȯ�մϴ�.
    DY - 3�ڸ� ���� �� ��ȯ�մϴ�.
    DAY - ������ ��ü �̸��� ��ȯ�մϴ�.
    DD - ���� ��(1-31)�� ���� �������� ��ȯ�մϴ�.
    HH, HH12, HH24 - 1�ϵ��� �ð� �Ǵ� ���� �ð�(1-12) �Ǵ� ���� �ð�(0-23)�� ��ȯ�մϴ�.
    MI - ��(0-59)�� ��ȯ�մϴ�.
    SS - ��(0-59)�� ��ȯ�մϴ�.
    FF - �и�������(0-999)�� ��ȯ�մϴ�.
    AM �Ǵ� PM - ����/���ĸ� ��Ÿ���� �ڿ��� ǥ�� ��ȯ�մϴ�.
    A.M. �Ǵ� P.M. - ����/���ĸ� ��Ÿ���� ��ħǥ�� �ִ� �ڿ��� ǥ�ø� ��ȯ�մϴ�.
  
*/
SELECT last_name, TO_CHAR(hire_date, 'YYYY/MM/DD HH24:MI:SS') AS HIREDATE
FROM employees;


























