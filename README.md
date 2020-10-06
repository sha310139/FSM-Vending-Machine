# FSM-Vending-Machine
利用有限狀態機的方法模擬出自動販賣機，分為四個狀態:投零錢、顯示可選擇飲料、給飲料、找零。
<br>
<br>
## 開發平台
Windows10<br>
<br>
<br>
## 開發環境
ModelSim PE Student Edition 10.4a<br>
<br>
<br>
## 使用說明
以ModelSim開啟專案<br>
將測資寫在testbetch中(stimulus.v)<br>
對stimulus.v進行模擬<br>
<br>
<br>

## 規則說明

![]()
<br>
* 開始投錢 （要顯示已投入多少錢）   <br>                      
	// 初始狀態 (S0)<br>
  <br>
* 當零錢到達飲料最低金額時，開始顯示可購買飲料名稱  <br>
	//選擇狀態  (S1)<br>
  <br>
* 當選擇飲料後輸出飲料名稱<br>
	//給予狀態  (S2)<br>
  <br>
* 找回零錢<br>
	//結帳狀態  (S3)<br>
  <br>
* 當退幣(reset)時  必須退出所有已輸入的零錢 回到初始的狀態<br>
	// 取消購買 (S0)<br>
  <br>
  
* 可以投入1元、5元、10元、50元<br>
  (不可同時投入多個硬幣，例如: 一次投入2個1元 )<br>
<br>

* 可以選擇的飲料共有四種tea、coke、coffee、milk，<br>
價格分別為10元、15元、20元、25元<br>
<br>
<br>

## 結果
![]
上圖為投幣後顯示之訊息結果，<br>
可看到買完<br>
<br>
<br>
![]
此圖為產生之waveform<br>
<br>
<br>
## 測試數據範例

```
module stimulus ;
/***
reg wire clk declare
***
/initial			螢幕輸出(display or monitor)
begin
  #10 coin = 10 ;		coin 10,	total 10 dollars	tea
  #10 coin = 5 ;		coin 5,	total 15 dollars	tea | coke
  #10 coin = 1 ;		coin 1,	total 16 dollars	tea | coke
  #10 coin = 10 ;		coin 10,	total 26 dollars	tea | coke | coffee | milk

  #10 coin = 0 ;
  #10 drink_choose = 3 ; //3=coffee	coffee out
  #10 drink_choose = 0 ;
			exchange 6 dollars
end
endmodule
```
