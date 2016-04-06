#property strict
#property stacksize                       8192
#property copyright                       "© 2009 - 20015, ВСИГНАЛЕ"
#property icon                            "Bookmark.ico"
//#property version                         "15.08"
#property link                            "http://vsignale.ru"
//#resource "res"

#property description                     "Торговый робот Vsignale ALIGARH, версия от 16.08.2015"


enum     OrdersType {
                              Only_Buy             =  1,          // Only Buy
                              Only_Sell            =  2,          // Only Sell
                              Buy_and_Sell         =  3,          // Buy and Sell
};

enum     On_Off {
                              OFF                  =  0,
                              ON                   =  1
};

enum     field {
                              LowHigh              =  0,          // Low/High
                              CloseClose           =  1           // Close/Close
};

enum     direction {
                              Both_Directions      =  0,          //Both Directions
                              ByTrend              =  1,          //By Trend
                              Opposite             =  2           //Opposite Trend
};

enum     enum_digits {
                              dig_3_5              =  5,          //3 or 5
                              dig_4                =  4           //4
};



sinput   string                                    = "";          //KEY
input    int                  magic_number         = 1;
input    enum_digits          digits               = 5;           //Digits for Stoploss & Takeprofit
input    OrdersType           ordersType           = Buy_and_Sell;
                 
input    int                  def                  = 50000;       //Start Lot = Balance /
input    int                  sl                   = 500,         //StopLoss
                              tp                   = 400;         //TakeProfit
input    double               recovery_factor_next = 1.5;         //Recovery Factor
input    On_Off               MartinGeil           = ON;
input    int                  maxLosses            = 4;           //Count of max losses



// 3
input    string               a1                   = "";          // 
input    string               b1                   = "";          //      
input    string               g1                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
input    string               c1                   = "For sell: MA1 < MA2        For buy: MA1 > MA2"; // 
input    int                  ma1_period           = 0;
input    ENUM_MA_METHOD       ma1_method           = MODE_SMA;        
input    ENUM_APPLIED_PRICE   ma1_price            = PRICE_CLOSE;
input    int                  ma2_period           = 0;
input    ENUM_MA_METHOD       ma2_method           = MODE_SMA;      
input    ENUM_APPLIED_PRICE   ma2_price            = PRICE_CLOSE; 
input    string               f1                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================



// 2
input    string               a14                  = "";          // 
input    string               b14                  = "";          //      
input    string               g14                  = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
input    string               c14                  = "For sell: MA3 < price        For buy: MA3 > price"; // 
input    int                  ma3_period           = 0;
input    ENUM_MA_METHOD       ma3_method           = MODE_SMA;        
input    ENUM_APPLIED_PRICE   ma3_price            = PRICE_CLOSE;                                         
input    On_Off               ma3_reverse          = OFF;
input    string               f14                  = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
               
               
               
// 4
input    string               a2                   = "";            // 
input    string               b2                   = "";            // 
input    string               g2                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
input    string               c2                   = "For sell: RVI < RVI_percents         For buy: RVI > RVI_percents";// 
input    int                  RVI_period           = 0;               
input    double               RVI_percents_bottom  = -1.00,          
                              RVI_percents_top     =  1.00;
input    direction            RVI_direction        = Both_Directions;
input    string               f2                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================



// 5
input    string               a3                   = "";            // 
input    string               b3                   = "";            // 
input    string               g3                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
extern   string               c3                   = "For sell: CCI < -CCI_percents         For buy: CCI > CCI_percents";// 
extern   int                  CCI_period           = 0;  
input    ENUM_APPLIED_PRICE   CCI_price            = PRICE_CLOSE;
extern   int                  CCI_percents_bottom  = -1000,
                              CCI_percents_top     = 1000;
input    direction            CCI_direction        = Both_Directions;
input    string               f3                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================



// 6
input    string               a4                   = "";             //  
input    string               b4                   = "";             // 
input    string               g4                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
extern   string               c4                   = "For sell: RSI < RSI_percents         For buy: RSI > 100-RSI_percents";  // 
extern   int                  RSI_period           = 0; 
input    ENUM_APPLIED_PRICE   RSI_price            = PRICE_CLOSE;
extern   int                  RSI_percents_range   = 0,
                              RSI_percents_top     = 100;
input    direction            RSI_direction        = Both_Directions;
input    string               f4                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================


// 8
input    string               a6                   = "";            // 
input    string               b6                   = "";            // 
input    string               g6                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
extern   string               c6                   = "For sell: MFI < MFI_percents         For buy: MFI > 100-MFI_percents";  // 
extern   int                  MFI_period           = 0,
                              MFI_percents_range   = 0,
                              MFI_percents_top     = 100;
input    direction            MFI_direction        = Both_Directions;
input    string               f6                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
               


// 9
input    string               a7                   = "";            // 
input    string               b7                   = "";            // 
input    string               g7                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
extern   string               c7                   = "For sell: ( Bulls + Bears ) / Point > BullsBears_percents         For buy: ( Bulls + Bears ) / Point < BullsBears_percents";  // 
extern   int                  Bulls_period         = 0;
input    ENUM_APPLIED_PRICE   Bulls_price          = PRICE_CLOSE;
extern   int                  Bears_period         = 0;
input    ENUM_APPLIED_PRICE   Bears_price          = PRICE_CLOSE;
extern   int                  BullsBears_percents  = 100;
input    string               f7                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
    


// 10
input    string               a8                   = "";          // 
input    string               b8                   = "";          // 
input    string               g8                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
extern   double               SAR_step             = 0.0,
                              SAR_maximum          = 0.2;                              
input    string               f8                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
    
    
               
               
// 7
input    string               a5                   = "";            // 
input    string               b5                   = "";            // 
input    string               g5                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
extern   string               c5                   = "Volumes:  kof_volume_1  <   avg(Volume1) / avg(Volume2)   <  kof_volume_2"; // 
extern   int                  n_volume_1           = 0,
                              n_volume_2           = 0;              
extern   double               kof_volume_1         = 0.1,
                              kof_volume_2         = 1.8; 
input    string               f5                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
      


// 11
input    string               a9                   = "";          // 
input    string               b9                   = "";          // 
input    string               g9                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
extern   string               c9                   = "Average True Range:  ATR_kof_1  <   avg(ATR1) / avg(ATR2)   <  ATR_kof_2"; // 
extern   int                  ATR_period_1         = 0,
                              ATR_period_2         = 2;
extern   double               ATR_kof_1            = 0.05,
                              ATR_kof_2            = 2.00;                              
input    string               f9                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
            
               
// 14
input    string               a12                           = "";            // 
input    string               b12                           = "";            // 
input    string               g12                           = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
extern   string               c12                           = "Awesome Oscillator"; // 
extern   int                  n_ao_1                        = 0,
                              n_ao_2                        = 0;              
extern   double               kof_ao_1                      = 0.1,
                              kof_ao_2                      = 1.8; 
input    string               f12                           = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================


int            result, Stoploss, Takeprofit, multi = 1, kol_losses=0, attempts = 1;
               
double         tempLots,               
               closeTP              = 0,
               closeSL              = 0,               
               maxBalans            = 0;
               
datetime       curBar;


bool           initialized    = False,
               TEST;   

void init() {
   TEST = IsOptimization() | IsTesting();
   Comment("");       
   
   if (digits == 4 && (_Digits == 3 || _Digits == 5)) {
      Takeprofit  = tp * 10;
      Stoploss    = sl * 10;
   }
   else if (digits == 5 && (_Digits == 4 || _Digits == 2)) {
      Takeprofit  = tp / 10;
      Stoploss    = sl / 10;
   }
   else {
      Takeprofit  = tp;
      Stoploss    = sl;
   }
   
   if (_Digits == 3 || _Digits == 5) {
      multi = 10;
   }
   
   curBar = iTime(NULL, NULL, 0);
   tempLots = maxProfit();
   
   Profit();   
   
   if (TEST || IsDemo() ||     ==  ()) {
      initialized = True;      
   }
   else {
      MessageBox(
         "Для торговли на реальном счёте необходимо\n"+
         "получить лицензионный ключ на сайте vsignale.ru\n\n"+
         "Ваш счёт: "+string(AccountNumber()), 
         "ВСИГНАЛЕ: Ошибка лицензии", MB_ICONERROR);
   } 
}


void deinit() {
   initialized = false;
}

void Error(string str) {   
   Comment(str);
   Print(str);
   
   ObjectCreate(str, OBJ_LABEL, 0, 0, 0);
   ObjectSet(str, OBJPROP_XDISTANCE, 5);
   ObjectSet(str, OBJPROP_YDISTANCE, 30);
   ObjectSet(str, OBJPROP_COLOR, Gold);
   ObjectSet(str, OBJPROP_BORDER_TYPE, 2);
   ObjectSetText(str, str , 18, "Calibri");
}

void DeleteError(string str) {
   ObjectDelete(str);
}

string  () { // 1  для номера аккаунта
   int acc = AccountNumber();
   int len = StringLen(IntegerToString(acc));
   int sum_1 = 1;
   for (int i=1; i<=len; i++) 
   sum_1 = int(MathMod(sum_1 + int (2117483647 / (173+MathMod(MathMod(acc+sum_1, MathMod(MathPow(13, i), 2127483647))*(i), 2137483647))),2147483647));
   return IntegerToString(sum_1);
}
  
void start()   {
   if (curBar != iTime(NULL, NULL, 0) && initialized) {
      TryToOpen();
   }
}

void TryToOpen() {  
   if(IsTradeAllowed()) {                  
      if (MayOpen() == true) {
         if (ordersType == 3  ||  ordersType == 1) CheckForOpen(OP_BUY);   
         if (ordersType == 3  ||  ordersType == 2) CheckForOpen(OP_SELL);      
      }        
      curBar = iTime(NULL, NULL, 0);
      Profit();
   }
}



// Выводим профит  +   -   =
void Profit() {
   //if (TEST) return;
   double profitPlus=0,
          profitMinus=0,
          profitSum=0,
          availableProfit = 0;
    
   if (!MayOpen()) availableProfit = MarketInfo(Symbol(), MODE_TICKVALUE)*OrderLots()*tp;
   int OrdersHistory=OrdersHistoryTotal();
   for (int i=OrdersHistory-1; i>=0; i--) {
      if (OrderSelect(i, SELECT_BY_POS, MODE_HISTORY) == false) break;
      if (OrderMagicNumber() != magic_number   ||   OrderSymbol() != Symbol()) continue;
      if       (OrderProfit() < 0) profitMinus += OrderProfit();
      else if  (OrderProfit() > 0) profitPlus += OrderProfit();
      else break;
   } 
   profitSum = profitPlus + profitMinus;
   
   Comment(StringFormat("#%d    +%.2f  %.2f  =  %.2f", magic_number, profitPlus, profitMinus, profitSum));
}



bool OptimizeLots() {
   double 
      profit=0;
   kol_losses = 0;
   int OrdersHistory=OrdersHistoryTotal(); 
   for (int i=OrdersHistory-1; i>=0; i--) {
      if (OrderSelect(i, SELECT_BY_POS, MODE_HISTORY) == false) break;
      if (OrderMagicNumber() != magic_number   ||   OrderSymbol() != Symbol()) continue;
      if (OrderProfit() < 0) {
         profit += OrderProfit();
         kol_losses += 1;
      }
      else break;
   }
              
   if (MartinGeil > 0) {      
      if (profit < 0) {      
         tempLots = MathCeil(-100.0*profit*recovery_factor_next/ MarketInfo(Symbol(), MODE_TICKVALUE) /Takeprofit)/100.0;
      }
      else tempLots = maxProfit();
   }
   else {
      tempLots = maxProfit();
   }
   
   if (kol_losses >= maxLosses) {
      if (TEST) ExpertRemove();
      else initialized = false;
      Error("Expert stopped");
      Alert("Expert removed ", _Symbol, ". Magic number: ", magic_number, "  Count of losses: ", maxLosses);
      
      return false;
   }
   
   return true;
}



double maxProfit() {
   return MathMax(MathMin(AccountFreeMargin(), AccountBalance()) / def, SymbolInfoDouble(NULL, SYMBOL_VOLUME_MIN));
}



bool MayOpen() {
   int orders = OrdersTotal();
   if (orders == 0) return (true);
   for(int i=0; i<orders; i++) {
      bool r = OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
      if(OrderMagicNumber() == magic_number) return (false);
   }
   return (true);
}


// Индикаторы

bool between(double what, double bottom, double top) {
   return bottom <= what && what <= top; 
}

bool Direction(double cmd_and_dir, double cur, double previous) {
   if (fmod(cmd_and_dir,2) == 0) {
      if (cur < previous) return (true);
   }
   else {
      if (cur > previous) return (true);
   }
   return false;
}

bool checkIma_1_2(int cmd) {  
   if          (ma1_period == 0) return (true);

   double ima1     = iMA(NULL, 0, ma1_period, 0, ma1_method, ma1_price, 0);
   double ima2     = iMA(NULL, 0, ma2_period, 0, ma2_method, ma2_price, 0);
   
   if          (cmd == OP_SELL   &&  ima1 < ima2) return (true);
   else if     (cmd == OP_BUY    &&  ima1 > ima2) return (true);
   
   return (false);
}


bool checkRVI(int cmd) {  
   if          (RVI_period == 0) return (true);
   double      rvi = iRVI(NULL, 0, RVI_period, 0, 0);   
   
   if (  
         (cmd == OP_SELL  &&  between(rvi, -RVI_percents_top, -RVI_percents_bottom))
            ||
         (cmd == OP_BUY   &&  between(rvi,  RVI_percents_bottom,  RVI_percents_top))   
      ) {
      if       (RVI_direction == 0)                                                    return (true);
      else if  (Direction(cmd+RVI_direction, rvi, iRVI(NULL, 0, RVI_period, 0, 1)))    return (true);
   }
  
   return (false);
}


bool checkCCI(int cmd) {  
   if          (CCI_period == 0) return (true);
   
   double      cci = iCCI(NULL, 0, CCI_period, CCI_price, 0);
   if (  
         (cmd == OP_SELL  &&  between(cci, -CCI_percents_top, -CCI_percents_bottom))
            ||
         (cmd == OP_BUY   &&  between(cci,  CCI_percents_bottom,  CCI_percents_top))   
      ) {
      if       (CCI_direction == 0)                                                          return (true);
      else if  (Direction(cmd+CCI_direction, cci, iCCI(NULL, 0, CCI_period, CCI_price, 1)))  return (true);
   }
   
   return (false);
}


bool checkRSI(int cmd) {  
   if          (RSI_period == 0) return (true);
   
   double      rsi = iRSI(NULL, 0, RSI_period, RSI_price, 0);  
   if (  
         (cmd == OP_SELL  &&  between(rsi, 100-RSI_percents_top, RSI_percents_range))
            ||
         (cmd == OP_BUY   &&  between(rsi, 100-RSI_percents_range, RSI_percents_top))   
      ) {
      if       (RSI_direction == 0)                                                          return (true);
      else if  (Direction(cmd+RSI_direction, rsi, iRSI(NULL, 0, RSI_period, RSI_price, 1)))  return (true);
   }
   
   return (false);
}


bool checkVolume() {
   if (n_volume_1 == 0) return (true);
   else {
      double   vol_1=0,
               vol_2=0,
               vol_res=0;
      for (int i=1; i<=n_volume_1; i++) {
         vol_1 += double(iVolume(NULL, 0, i));
      }
      vol_1 /= n_volume_1;
      
      for (int i=1; i<=n_volume_2; i++) {
         vol_2 += double(iVolume(NULL, 0, i));
      }
      vol_2 /= n_volume_2;
      
      vol_res = vol_1 / vol_2;
      
      if (kof_volume_1 < kof_volume_2) return kof_volume_1 < vol_res  &&  vol_res < kof_volume_2;
      else return vol_res > kof_volume_1  ||  kof_volume_2 > vol_res;
   }
}


bool checkAO() {
   if (n_ao_1 == 0) return (true);
   else {
      double   ao_1=0,
               ao_2=0,
               ao_res=0;
      for (int i=1; i<=n_ao_1; i++) {
         ao_1 += double(iAO(NULL, 0, i));
      }
      ao_1 /= n_ao_1;
      
      for (int i=1; i<=n_ao_2; i++) {
         ao_2 += double(iAO(NULL, 0, i));
      }
      ao_2 /= n_ao_2;
      
      ao_res = ao_1 / ao_2;
      
      if (kof_ao_1 < kof_ao_2) return kof_ao_1 < ao_res  &&  ao_res < kof_ao_2;
      else return ao_res > kof_ao_1  ||  kof_ao_2 > ao_res;
   }
}


bool checkMFI(int cmd) {
   if          (MFI_period == 0) return (true);
   
   double      mfi = iMFI(NULL, 0, MFI_period, 1);
   if (  
         (cmd == OP_SELL  &&  between(mfi, 100-MFI_percents_top, MFI_percents_range))
            ||
         (cmd == OP_BUY   &&  between(mfi, 100-MFI_percents_range, MFI_percents_top))   
      ) {
      if       (MFI_direction == 0)                                                 return (true);
      else if  (Direction(cmd+MFI_direction, mfi, iMFI(NULL, 0, MFI_period, 2)))    return (true);
   }
   
   return (false);  
}


bool checkBullsBears(int cmd) {
   if          (Bulls_period == 0  &&  Bears_period == 0) return (true);
      
   double      BullsBears;
   if          (Bears_period == 0) BullsBears = iBullsPower(NULL, 0, Bulls_period, Bulls_price, 1)/Point;
   else if     (Bulls_period == 0) BullsBears = iBearsPower(NULL, 0, Bears_period, Bears_price, 1)/Point;
   else        BullsBears = (
                        iBullsPower(NULL, 0, Bulls_period, Bulls_price, 1)+
                        iBearsPower(NULL, 0, Bears_period, Bears_price, 1)
                        )/Point;
   
   if          (cmd == OP_SELL  &&  BullsBears > BullsBears_percents) return (true);
   else if     (cmd == OP_BUY   &&  BullsBears < BullsBears_percents) return (true);
   else return (false);   
}


bool checkSAR(int cmd) {
   if          (SAR_step == 0) return (true);
   
   double      sar = iSAR(NULL, 0, SAR_step, SAR_maximum, 1);   
   if          (cmd == OP_SELL  &&  Bid < sar)  return (true);
   else if     (cmd == OP_BUY   &&  Ask > sar)  return (true);
   else return (false);   
}


bool checkATR(int cmd) {
   if          (ATR_period_1 == 0) return (true);
   
   double      atr_res = iATR(NULL, 0, ATR_period_1, 1) / iATR(NULL, 0, ATR_period_2, 1);
               
   if (ATR_kof_1 < ATR_kof_2) return ATR_kof_1 < atr_res  &&  atr_res < ATR_kof_2;
   else return atr_res > ATR_kof_1  ||  ATR_kof_2 > atr_res;
}


bool checkIma_3(int cmd) { 
   if          (ma3_period == 0) return (true);

   double ima     = iMA(NULL, 0, ma3_period, 0, ma3_method, ma3_price, 0);
   
   if          (cmd == ((OP_SELL+ma3_reverse) & 1)   &&  Close[1] < ima) return (true);
   else if     (cmd == ((OP_BUY +ma3_reverse) & 1)   &&  Close[1] > ima) return (true);
   
   return (false);
}






void CheckForOpen(int cmd) {
      if (checkIma_3(cmd))
         if (checkATR(cmd))
            if (checkSAR(cmd))
               if (checkAO())
                  if (checkIma_1_2(cmd))
                     if (checkRVI(cmd))
                        if (checkCCI(cmd))
                           if (checkRSI(cmd)) 
                              if (checkBullsBears(cmd))
                                 if (checkVolume()) 
                                    if (checkMFI(cmd))                   
                                       if (OptimizeLots()) {
                                          if (cmd == OP_BUY) {
                                             closeTP = Open[0]+Ask-Bid+Takeprofit*Point;
                                             closeSL = Open[0]+Ask-Bid-Stoploss*Point;
                                          }
                                          else if (cmd == OP_SELL) {
                                             closeTP = Open[0]-Takeprofit*Point;
                                             closeSL = Open[0]+Stoploss*Point;
                                          } 
                                          else return;
                                          
                                          openTrade(cmd); 
                                          return;
   }   
}


void openTrade(int cmd) {
   RefreshRates();
   result = OrderSend(Symbol(), cmd,  tempLots, cmd == OP_BUY ? Ask : Bid, 5*multi, closeSL, closeTP, StringFormat("#%d (%d of %d)", magic_number, kol_losses+1, maxLosses), magic_number, 0, Red);                                       
   if (result == -1) {   
      int lastError = GetLastError(); 
      if (TEST) {
         Comment("Error #", lastError); 
         Print("Error #", lastError); 
         ExpertRemove(); 
      }
      else if (lastError == 134) {
         Alert(_Symbol, ". Magic number: ", magic_number, ". Error #", lastError, "   Not enough money to open trade: ");
         attempts = 1;
      }
      else {
         if (attempts % 5 == 1) {
            string msg = StringFormat("Valute: %s. Magic number: #%d. Error #%d. Attempts: %d", _Symbol, magic_number, lastError, attempts);
            Alert(msg);
            Print(msg);
         }
         Sleep(1000);
         if (MayOpen() == true) {
            attempts++;
            if (attempts < 20) openTrade(cmd);
            else if (attempts < 60) CheckForOpen(cmd);
            else Alert("Error opening");
         }
         else {
            Alert(StringFormat("OK! Valute: %s. Magic number: #%d. Attempts: %d", _Symbol, magic_number, attempts));
            attempts = 1;
         }
      }               
   }
   else {
      attempts = 1;
   }
}


