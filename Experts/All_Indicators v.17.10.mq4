#property strict
#property stacksize                       8192
#property copyright                       "Perfilov Family © (2017)"
//#property icon                            "Bookmark.ico"
#property version                         "17.10"
/*#property link                            "https://tr.im/aligarh"*/

#property description                     "contacts:  stanislav.perfilov@gmail.com"
#property description                     ""


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

enum     recoveryType {
                              recovery_next_only   =  0,          //use Recovery Factor Next 
                              multi_recovery       =  1           //use Multi Recovery (1, 2, 3)
};


enum     enum_digits {
                              dig_3_5              =  5,          //3 or 5
                              dig_4                =  4           //4
};

enum     METHOD  {
                              SMA                  = 0,    //Simple
                              EMA                  = 1,    //Exponential
                              LWMA                 = 3     //Linear weighted
};



sinput   string                                    = "";          //Access number   
input    int                  magic_number         = 1;
input    enum_digits          digits               = 5;           //Digits for Stoploss & Takeprofit
input    OrdersType           ordersType           = Buy_and_Sell;
                 
input    int                  def                  = 10000;       //def:                     Lot = Balance / 
input    double               sl                   = 0.8,         //StopLoss
                              tp                   = 400;         //TakeProfit                           
input    recoveryType         multi_recovery       = 1;           //recoveryType 
input    double               recovery_factor_1    = 1.75,        //Recovery Factor 1
                              recovery_factor_2    = 1.5,         //Recovery Factor 2
                              recovery_factor_3    = 1.25,        //Recovery Factor 3 
                              recovery_factor_4    = 1.15,        //Recovery Factor 4 
                              recovery_factor_next = 1.1;         //Recovery Factor Next                                          
input    On_Off               MartinGeil           = ON;
input    int                  maxLosses            = 4;           //Count of max losses
input    int                  Optimization         = 0;           //For optimization only



// 3
input    string               a1                   = "";          // 
input    string               b1                   = "";          //      
input    string               g1                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
input    string               c1                   = "For sell: MA1 < MA2        For buy: MA1 > MA2"; // 
input    int                  ma1_period           = 0;
input    METHOD               ma1_method           = SMA;        
input    ENUM_APPLIED_PRICE   ma1_price            = PRICE_CLOSE;
input    int                  ma2_period           = 0;
input    METHOD               ma2_method           = SMA;      
input    ENUM_APPLIED_PRICE   ma2_price            = PRICE_CLOSE; 
input    string               f1                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================



input    string               a14                  = "";          // 
input    string               b14                  = "";          //      
input    string               g14                  = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
input    string               c14                  = "For sell: MA3 < price        For buy: MA3 > price"; // 
input    int                  ma3_period           = 0;
input    METHOD               ma3_method           = SMA;        
input    ENUM_APPLIED_PRICE   ma3_price            = PRICE_CLOSE;
input    ENUM_APPLIED_PRICE   ma3_bar_price        = PRICE_CLOSE;                                         
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
input    string               f4                   = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================


// 12
input    string               a10                           = "";          // 
input    string               b10                           = "";          // 
input    string               g10                           = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
extern   int                  Stochastic_k_period           = 0,
                              Stochastic_d_period           = 0,
                              Stochastic_slowing            = 0;
extern   int                  Stochastic_percents_range     = 0,
                              Stochastic_percents_top       = 100;
input    METHOD               Stochastic_method             = SMA;      
input    field                Stochastic_field              = LowHigh;
input    string               f10                           = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================



// 13
input    string               a11                           = "";          //  
input    string               b11                           = "";          // 
input    string               g11                           = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
extern   int                  Williams_period               = 0,
                              Williams_percents_range       = 30,
                              Williams_percents_top         = 100;
input    string               f11                           = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================



               
               
// 14
/*
input    string               a15                           = "";            // 
input    string               b15                           = "";            // 
input    string               g15                           = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
sinput   string               c15                           = "LINKS"; // 
sinput   string               l_01                          = "https://tr.im/aligarh";       //Real PAMM Account - ALIGARH
sinput   string               l_02                          = "https://tr.im/sharedfiles";   //__SHARED_FILES__
sinput   string               l_03                          = "https://tr.im/monitoring";    //Statistic of real accounts on MyFxBook.com
sinput   string               l_04                          = "https://tr.im/instruction";   //Instruction of the EA
sinput   string               l_05                          = "https://tr.im/rebate";        //Get back money for spread
sinput   string               f15                           = "================================================================================================================================================================================================================================================"; //================================================================================================================================================================
          
*/
                             

int            result, multi = 1, Stoploss, Takeprofit, kol_losses=0, attempts = 1;
               
double         tempLots,               
               closeTP              = 0,
               closeSL              = 0,               
               maxBalans            = 0,
               Def;
               
datetime       curBar;


bool           initialized    = False,
               fixedLot       = True,
               TEST;
               
               
string btnName = "Try to open";
               

void init() {
   TEST = IsOptimization() | IsTesting();
   int acc = AccountNumber();
   Comment("");   
   if (magic_number < 2 && !TEST) {
      Error("Change magic_number");
      ExpertRemove();
      return;
   }
   else {
      DeleteError("Change magic_number");
   }
   
   if (TEST) {
      fixedLot = False;      
   }
   else {
      if (IsDemo()) {
         fixedLot = False;
      }
      else if (    () ||    ==  () ||   ()) {
         fixedLot = False;
         DeleteError("Wrong access number or account name. Fixed lot = " + DoubleToString(SymbolInfoDouble(NULL, SYMBOL_VOLUME_MIN), 2));
      }
      else {      
         Error("Wrong access number or account name. Fixed lot = "  + DoubleToString(SymbolInfoDouble(NULL, SYMBOL_VOLUME_MIN), 2));
      }      
      CreateButton(); 
   }
   
   
   Def = def * (MarketInfo(Symbol(),MODE_LOTSIZE) / 10000.0);
   if (sl > -5.0 && sl < 5) Stoploss = tp*sl;
   else if (sl <= 200.0) Stoploss = tp  + sl;
   else Stoploss = sl;
         
   if (digits == 4 && (_Digits == 3 || _Digits == 5)) {
      Takeprofit  = int(tp * 10);
      Stoploss    = int(Stoploss) * 10;
   }
   else if (digits == 5 && (_Digits == 4 || _Digits == 2)) {
      Takeprofit  = int(tp / 10);
      Stoploss    = int(Stoploss) / 10;
   }
   else {
      Takeprofit  = int(tp);
      Stoploss    = int(Stoploss);
   }
   
   if (_Digits == 3 || _Digits == 5) {
      multi = 10;
   }
   
   curBar = iTime(NULL, NULL, 0);
   tempLots = maxProfit();
   
   Profit();    
   initialized = true; 
}

void deinit() {
   ObjectDelete(0, btnName);
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

bool     () { // 4  для имени
   string acName   = AccountName();
   StringToLower(acName);
   
   string splitedAccName[];
   int namesInAccName = StringSplit(acName, 32, splitedAccName);
      
   ulong multipliers[];   
   ArrayResize(multipliers, namesInAccName);
   ArrayInitialize(multipliers, 1);
   
   for (int j=0; j<namesInAccName; j++) {
      for (int i=0; i<StringLen(splitedAccName[j]); i++) {
         multipliers[j] = (multipliers[j] * StringGetChar(splitedAccName[j], i)) % 0xEfCdAB896;
      }
   }
   
   for (int j=0; j<namesInAccName-1; j++) {      
      for (int k=j+1; k<namesInAccName; k++) {
         if (IntegerToString(multipliers[j] + multipliers[k]) ==   ) {
            return true;
         }
      }
   }
   
   return false;
}

bool   () {
   string 
            name     = "Перфилова", 
            surname  = "Наталья",
            acName   = AccountName();
   if (         
         StringFind(acName, name)      >= 0 &&
         StringFind(acName, surname)   >= 0         
      ) {
         return true;      
      }
   return false;
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
   if (TEST) return;
   double profitPlus=0,
          profitMinus=0,
          profitSum=0,
          availableProfit = 0;
    
   if (!MayOpen()) availableProfit = MarketInfo(Symbol(), MODE_TICKVALUE)*OrderLots()*Takeprofit;
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
      profit=0,
      recovery_factor = 0;
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
      if (multi_recovery == 1) {
         switch(kol_losses) {
            case 1: recovery_factor = recovery_factor_1; break;
            case 2: recovery_factor = recovery_factor_2; break;
            case 3: recovery_factor = recovery_factor_3; break;
            case 4: recovery_factor = recovery_factor_4; break;
            default: recovery_factor = recovery_factor_next;break;
         }
      }
      else {
         recovery_factor = recovery_factor_next;
      }
      
      if (profit < 0) {      
         tempLots = MathCeil(-100.0*profit*recovery_factor/ MarketInfo(Symbol(), MODE_TICKVALUE) /Takeprofit)/100.0;
      }
      else tempLots = maxProfit();
   }
   else {
      tempLots = maxProfit();
   }
   
   if(IsOptimization()) {   
      if (Optimization != 0) tempLots += MathFloor((TimeCurrent() - D'2015.08.05 00:00')/3600.0/24/Optimization)*0.01;
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
   if ( fixedLot ) return SymbolInfoDouble(NULL, SYMBOL_VOLUME_MIN);
   return MathMax(MathMin(AccountFreeMargin(), AccountBalance()) / Def, SymbolInfoDouble(NULL, SYMBOL_VOLUME_MIN));
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

/*bool Direction(double cmd_and_dir, double cur, double previous) {
   if (fmod(cmd_and_dir,2) == 0) {
      if (cur < previous) return (true);
   }
   else {
      if (cur > previous) return (true);
   }
   return false;
}*/

bool checkIma_1_2(int cmd) {  
   if          (ma1_period == 0) return (true);

   double ima1    = iMA(NULL, 0, ma1_period, 0, int(ma1_method), ma1_price, 0);
   if (ma2_period == 0) {
      if          (cmd == OP_SELL   &&  Close[1] < ima1) return (true);
      else if     (cmd == OP_BUY    &&  Close[1] > ima1) return (true);
      else                                               return (false);
   }
      
   double ima2    = iMA(NULL, 0, ma2_period, 0, int(ma2_method), ma2_price, 0);
   if          (cmd == OP_SELL   &&  ima1 < ima2)  return (true);
   else if     (cmd == OP_BUY    &&  ima1 > ima2)  return (true);
   
   return (false);
}

bool checkIma_3(int cmd) {  
   if          (ma3_period == 0) return (true);

   double ima3    = iMA(NULL, 0, ma3_period, 0, int(ma3_method), ma3_price, 0);
   double bar_price    = iMA(NULL, 0, 1, 1,int(0), ma3_bar_price, 0);   
   
   cmd = MathMod(cmd + int(ma3_reverse), 2);
   if          (cmd == OP_SELL   &&  bar_price < ima3) return (true);
   else if     (cmd == OP_BUY    &&  bar_price > ima3) return (true);

   
   return (false);
}


bool checkRVI(int cmd) {  
   if          (RVI_period == 0) return (true);
   double      rvi = iRVI(NULL, 0, RVI_period, 0, 0);   
   
   if (  
         (cmd == OP_SELL  &&  between(rvi, -RVI_percents_top, -RVI_percents_bottom))
            ||
         (cmd == OP_BUY   &&  between(rvi,  RVI_percents_bottom,  RVI_percents_top))   
      ) return (true);
  
   return (false);
}


bool checkCCI(int cmd) {  
   if          (CCI_period == 0) return (true);
   
   double      cci = iCCI(NULL, 0, CCI_period, CCI_price, 0);
   if (  
         (cmd == OP_SELL  &&  between(cci, -CCI_percents_top, -CCI_percents_bottom))
            ||
         (cmd == OP_BUY   &&  between(cci,  CCI_percents_bottom,  CCI_percents_top))   
      ) return (true);
   
   return (false);
}


bool checkRSI(int cmd) {  
   if          (RSI_period == 0) return (true);
   
   double      rsi = iRSI(NULL, 0, RSI_period, RSI_price, 0);  
   if (  
         (cmd == OP_SELL  &&  between(rsi, 100-RSI_percents_top, RSI_percents_range))
            ||
         (cmd == OP_BUY   &&  between(rsi, 100-RSI_percents_range, RSI_percents_top))   
      ) return (true);
   
   return (false);
}


bool checkStochastic(int cmd) {  
   if          (Stochastic_k_period == 0) return (true);
   
   double      stochastic = iStochastic(NULL, 0, Stochastic_k_period, Stochastic_d_period, Stochastic_slowing, int(Stochastic_method), int(Stochastic_field), MODE_MAIN, 0);
   if (  
         (cmd == OP_SELL  &&  between(stochastic, 100-Stochastic_percents_top, Stochastic_percents_range))
            ||
         (cmd == OP_BUY   &&  between(stochastic, 100-Stochastic_percents_range, Stochastic_percents_top))   
      ) return (true);
   
   return (false);
}


bool checkWilliams(int cmd) {  
   if          (Williams_period == 0) return (true);
      
   double      williams = iWPR(NULL, 0, Williams_period, 1);  
   if (  
         (cmd == OP_SELL  &&  between(williams, -Williams_percents_top, Williams_percents_range-100))
            ||
         (cmd == OP_BUY   &&  between(williams, Williams_percents_top-100, -Williams_percents_range))   
      ) return (true);
   
   return (false);
}




void CheckForOpen(int cmd) {
   if (checkIma_1_2(cmd))
      if (checkIma_3(cmd))
         if (checkRVI(cmd))
            if (checkCCI(cmd))
               if (checkRSI(cmd)) 
                  if (checkStochastic(cmd))
                     if (checkWilliams(cmd))                                     
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


void CreateButton() {
   ObjectDelete(0, btnName);
   ObjectCreate(0, btnName,OBJ_BUTTON, 0,0,0);
   ObjectSetString(0, btnName,OBJPROP_TEXT, btnName);
   ObjectSetString(0, btnName,OBJPROP_FONT, "Calibri");
   
   int p[10][2] = {
      OBJPROP_XDISTANCE,      10,
      OBJPROP_YDISTANCE,      30,
      OBJPROP_XSIZE,          150,
      OBJPROP_YSIZE,          22,
      OBJPROP_FONTSIZE,       12,
      OBJPROP_COLOR,          clrWhite,
      OBJPROP_BGCOLOR,        C'00,172,240',
      OBJPROP_BORDER_COLOR,   C'00,130,210',
      OBJPROP_SELECTABLE,     false,
      OBJPROP_CORNER,         CORNER_LEFT_LOWER
   };
   
   for (int i=0; i<10; i++) ObjectSetInteger(0,btnName,p[i][0], p[i][1]);
}

void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)  {                  
   if(sparam == btnName) { // если нажали на кнопку "Try to open"      
      ObjectSetString(0, btnName,OBJPROP_TEXT, StringFormat("%s [%s]", btnName, TimeToStr(TimeCurrent(),TIME_SECONDS)));
      TryToOpen();
      ObjectSetInteger(0,btnName, OBJPROP_STATE,false);
   }
}

