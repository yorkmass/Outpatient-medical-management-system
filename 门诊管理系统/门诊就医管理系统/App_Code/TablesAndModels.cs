

using System;

namespace LYS.Enum
{
   
    public enum Vip
    {
        RecordID,
        VipID,
        VipRole,
        VipSta,
        VipPrice
    }
   
}


namespace LYS.Entity
{
   
    public class Tab_Vip
    {
        public Int32? RecordID { get; set; }
        public String VipID { get; set; }
        public String VipRole { get; set; }
        public String VipSta { get; set; }
        public Int32? VipPrice { get; set; }
    }
    
}


