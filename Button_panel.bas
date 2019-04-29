'##########################################
'Панель подключения кнопок.
'Контроллер считывает состояния кнопок
'И если нажата одна из них, то переключает реле на выходе
'И подсвечивает кнопку, которая была нажата
'Для сброса индикации нужно нажать кнопку Reset
'Евгений Быков
'evg-bikov@yandex.ru
'##########################################

$regfile = "m8def.dat"
$crystal = 8000000

Config Portb.0 = Input                                      'Кнопка
Config Portb.1 = Input                                      'Кнопка
Config Portb.2 = Input                                      'Кнопка
Config Portb.3 = Input                                      'Кнопка
Config Portb.4 = Input                                      'Кнопка
Config Portb.5 = Input                                      'Кнопка
Config Portb.6 = Input                                      'Кнопка
Config Portb.7 = Input                                      'Кнопка
Config Portc.0 = Input                                      'Кнопка
Config Portc.1 = Input                                      'Кнопка
Config Portd.6 = Input                                      'Сброс


Config Portd.5 = Output                                     'Светодиод
Config Portd.4 = Output                                     'Светодиод
Config Portd.3 = Output                                     'Светодиод
Config Portd.2 = Output                                     'Светодиод
Config Portd.1 = Output                                     'Светодиод
Config Portd.0 = Output                                     'Светодиод
Config Portc.5 = Output                                     'Светодиод
Config Portc.4 = Output                                     'Светодиод
Config Portc.3 = Output                                     'Светодиод
Config Portc.2 = Output                                     'Светодиод


Config Portd.7 = Output                                     'Выход

Dim Zaderjka As Integer , Vihod_time As Integer , I As Integer
Dim Najatie(11) As Byte
Dim Led_status(10) As Byte
Declare Sub Alarm
Declare Sub Online
Declare Sub Sbros

Button1 Alias Pinb.0
Button2 Alias Pinb.1
Button3 Alias Pinb.2
Button4 Alias Pinb.3
Button5 Alias Pinb.4
Button6 Alias Pinb.5
Button7 Alias Pinb.6
Button8 Alias Pinb.7
Button9 Alias Pinc.0
Button10 Alias Pinc.1
Res_button Alias Pind.6

Led1 Alias Portd.5
Led2 Alias Portd.4
Led3 Alias Portd.3
Led4 Alias Portd.2
Led5 Alias Portd.1
Led6 Alias Portd.0
Led7 Alias Portc.5
Led8 Alias Portc.4
Led9 Alias Portc.3
Led10 Alias Portc.2
Vihod Alias Portd.7

Led1 = 0
Led2 = 0
Led3 = 0
Led4 = 0
Led5 = 0
Led6 = 0
Led7 = 0
Led8 = 0
Led9 = 0
Led10 = 0
Vihod = 0

For I = 1 To 11
Najatie(i) = 0
Next I

Zaderjka = 1000                                             'Задержка нажатия кнопки
Vihod_time = 2000                                           'Длительность включения реле
Do

If Button1 = 1 Then Najatie(1) = 1
If Button2 = 1 Then Najatie(2) = 1
If Button3 = 1 Then Najatie(3) = 1
If Button4 = 1 Then Najatie(4) = 1
If Button5 = 1 Then Najatie(5) = 1
If Button6 = 1 Then Najatie(6) = 1
If Button7 = 1 Then Najatie(7) = 1
If Button8 = 1 Then Najatie(8) = 1
If Button9 = 1 Then Najatie(9) = 1
If Button10 = 1 Then Najatie(10) = 1
If Res_button = 1 Then Najatie(11) = 1
Waitms Zaderjka
If Button1 = 1 And Najatie(1) = 1 Then
Call Alarm
Led1 = 1
Najatie(1) = 0
Led_status(1) = 1
End If
If Button2 = 1 And Najatie(2) = 1 Then
Call Alarm
Led2 = 1
Najatie(2) = 0
Led_status(2) = 1
End If
If Button3 = 1 And Najatie(3) = 1 Then
Call Alarm
Led3 = 1
Najatie(3) = 0
Led_status(3) = 1
End If
If Button4 = 1 And Najatie(4) = 1 Then
Call Alarm
Led4 = 1
Najatie(4) = 0
Led_status(4) = 1
End If
If Button5 = 1 And Najatie(5) = 1 Then
Call Alarm
Led5 = 1
Najatie(5) = 0
Led_status(5) = 1
End If
If Button6 = 1 And Najatie(6) = 1 Then
Call Alarm
Led6 = 1
Najatie(6) = 0
Led_status(6) = 1
End If
If Button7 = 1 And Najatie(7) = 1 Then
Call Alarm
Led7 = 1
Najatie(7) = 0
Led_status(7) = 1
End If
If Button8 = 1 And Najatie(8) = 1 Then
Call Alarm
Led8 = 1
Najatie(8) = 0
Led_status(8) = 1
End If
If Button9 = 1 And Najatie(9) = 1 Then
Call Alarm
Led9 = 1
Najatie(9) = 0
Led_status(9) = 1
End If
If Button10 = 1 And Najatie(10) = 1 Then
Call Alarm
Led10 = 1
Najatie(10) = 0
Led_status(10) = 1
End If
If Res_button = 1 And Najatie(11) = 1 Then
Call Sbros
Najatie(11) = 0
End If


Call Online
Loop


Sub Alarm
Vihod = 1
Waitms Vihod_time
Vihod = 0
End Sub

Sub Online
If Led_status(1) = 0 Then Led1 = 1
If Led_status(2) = 0 Then Led2 = 1
If Led_status(3) = 0 Then Led3 = 1
If Led_status(4) = 0 Then Led4 = 1
If Led_status(5) = 0 Then Led5 = 1
If Led_status(6) = 0 Then Led6 = 1
If Led_status(7) = 0 Then Led7 = 1
If Led_status(8) = 0 Then Led8 = 1
If Led_status(9) = 0 Then Led9 = 1
If Led_status(10) = 0 Then Led10 = 1
Waitms 25
If Led_status(1) = 0 Then Led1 = 0
If Led_status(2) = 0 Then Led2 = 0
If Led_status(3) = 0 Then Led3 = 0
If Led_status(4) = 0 Then Led4 = 0
If Led_status(5) = 0 Then Led5 = 0
If Led_status(6) = 0 Then Led6 = 0
If Led_status(7) = 0 Then Led7 = 0
If Led_status(8) = 0 Then Led8 = 0
If Led_status(9) = 0 Then Led9 = 0
If Led_status(10) = 0 Then Led10 = 0
End Sub

Sub Sbros
For I = 1 To 11
Najatie(i) = 0
Next I

For I = 1 To 10
Led_status(i) = 0
Next I

Led1 = 0
Led2 = 0
Led3 = 0
Led4 = 0
Led5 = 0
Led6 = 0
Led7 = 0
Led8 = 0
Led9 = 0
Led10 = 0
Vihod = 0
End Sub