--��� �������� ����������� �� ����������� �������� � ��������� � ��� ��� ���������� active ��������� 

--  x, y  - ���������� ������ ������( ��� y ����������� ����). ��������� �������� �� 0 �� 1 
-- texture_name - ��� �����-�������� ��� ������
-- action - ��������, ������� ����������� ��� ������� �� ������.  ���������� �����, ������������� ��� �������
-- ������ � ������ ������ ������������ �� ��������

return {{x = 0.5, y = 0.3 , texture_name = "graphics/menu/botton.bmp", text = "new game", action = NEW_GAME },
		-- 
		{x = 0.5, y = 0.5 , texture_name = "graphics/menu/botton.bmp", text = "load", action = LOAD_GAME },
		--
		{x = 0.5, y = 0.7 , texture_name = "graphics/menu/botton.bmp", text = "option", action = GO_TO_OPTIONS },
		--
		{x = 0.5, y = 0.9 , texture_name = "graphics/menu/botton.bmp", text = "exit", action = EXIT }
		--
		-- ���� ����� ������� ����� ������ �� ��������
		
		}