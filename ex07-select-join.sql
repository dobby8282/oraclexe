/*
���ϸ�: ex07-select-join.sql

JOIN
    SQL���� �� �� �̻��� ���̺��� ���õ� ����� �����ϱ� ���� �����Դϴ�.

*/

/*
Natural Join
    �� ���̺��� ������ ������ �̸��� ��ġ�ϴ� ���� ������� �ڵ�����
    ���̺��� ������ �� �ֽ��ϴ�.
*/
SELECT department_id, department_name,
        location_id, city
FROM departments
NATURAL JOIN locations;












