//+------------------------------------------------------------------+
//|                                                      expert3.mq4 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int order;



int OnInit()
  {
//--- create timer
   EventSetTimer(60);
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
double movingAverage = iMA(NULL,5,3,3,MODE_SMA,PRICE_MEDIAN,0);

double currentPrice = Open[0];
double lastPrice = Open[1];

if ((currentPrice > movingAverage ) && (currentPrice < lastPrice ) )
{
//Sell
order = OrderSend(NULL,OP_SELL,1,currentPrice,0,NULL,NULL,NULL,0,0,NULL);

} 
else if ((currentPrice < movingAverage ) && (currentPrice > lastPrice ) )
{ //Buy
order = OrderSend(NULL,OP_BUY,1,currentPrice,0,NULL,NULL,NULL,0,0,NULL);
}
   
   Alert ("BOUGHT AT "+lastPrice+" CURRENT BALANCE "+currentPrice);
   
}
  
 
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   
  }
//+------------------------------------------------------------------+
