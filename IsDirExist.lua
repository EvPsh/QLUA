function IsDirExist(directory)
-- �������� ������������� �����
-- ���������� true/false � ��������� ����������
-- ������ ����������� ��� nil � ������ ������
-- ��� ����� � ������ ������
---

	return os.rename(directory, directory)
end
