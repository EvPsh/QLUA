--������� � �����:
--labelgreen("brent", 20200429, 193000, 24.10, "|") --�������������, ����, �����, �������, ����� (������� �����)
--labelred("brent", 20200429, 200000, 24.60, "|") --�������������, ����, �����, �������, ����� (������� �����)


function labelred(ident, date, time, value, text)
--ident - ������������� �������  (ctrl-E � ���� ������� quik -> price -> ������������� -> ������������� "brent")
--date ���� �������
--time ���� ������
--value ���� 23.00
local table label_params={
	TEXT=text, --������� ��� ������ �-���
	DATE=date, --���� ���� 20200427, ������� ��� ������ �-���
	TIME=time, --������� ��� ������ �-���
	FONT_HEIGHT=15,
	YVALUE=value, --������� ��� ������ �-���
	R=255,
	G=0,
	B=0,
	TRANSPARENT_BACKGROUND=1
	}
AddLabel(ident,label_params) -- ������� ����������� �� ������ � ��������������� 'brent'
end

function labelgreen(ident, date, time, value, text)
--ident - ������������� �������  (ctrl-E � ���� ������� quik -> price -> ������������� -> ������������� "brent")
--date ���� �������
--time ���� ������
--value ���� 23.00
local table label_params={
	TEXT=text, --������� ��� ������ �-���
	DATE=date, --���� ���� 20200427, ������� ��� ������ �-���
	TIME=time, --������� ��� ������ �-���
	FONT_HEIGHT=15,
	YVALUE=value, --������� ��� ������ �-���
	R=0,
	G=255,
	B=0,
	TRANSPARENT_BACKGROUND=1
	}
AddLabel(ident,label_params) -- ������� ����������� �� ������ � ��������������� 'brent'
end
