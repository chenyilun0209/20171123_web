using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace ezapp
{
    public class ezCart
    {
        /// <summary>
        /// 購物車私有變數
        /// </summary>
        private static DataTable _BuyCart;
        /// <summary>
        /// 購物車屬性 BuyCart
        /// </summary>
        public static DataTable BuyCart
        {
            get
            {
                if (_BuyCart == null)
                {
                    _BuyCart = new DataTable("buycart");
                    _BuyCart.Columns.Add("pNo", typeof(string));
                    _BuyCart.Columns.Add("pImg", typeof(string));
                    _BuyCart.Columns.Add("pName", typeof(string));
                    _BuyCart.Columns.Add("pStyle", typeof(string));
                    _BuyCart.Columns.Add("size", typeof(string));
                    _BuyCart.Columns.Add("qty", typeof(int));
                    _BuyCart.Columns.Add("price", typeof(int));
                    _BuyCart.Columns.Add("amount", typeof(int));
                    _BuyCart.Columns.Add("buy_date", typeof(DateTime));
                    _BuyCart.Columns.Add("cart_id", typeof(string));
                    _BuyCart.Columns.Add("rowid", typeof(string));
                }
                return _BuyCart;
            }
            set { _BuyCart = value; }
        }

        /// <summary>
        /// 取得購物車 ID
        /// </summary>
        public static string CartID
        {
            get { return (HttpContext.Current.Session["CartID"] == null) ? Guid.NewGuid().ToString() : HttpContext.Current.Session["CartID"].ToString(); }
            set { HttpContext.Current.Session["CartID"] = value; }
        }

        /// <summary>
        /// 重新變更交易ID
        /// </summary>
        public static void ChangeCartID()
        {
            CartID = Guid.NewGuid().ToString();
        }

        /// <summary>
        /// 加入購物車記錄
        /// </summary>
        /// <param name="sProdNo">商品代號</param>
        /// <param name="sProdName">商品名稱</param>
        /// <param name="sProdStyle">商品規格</param>
        /// <param name="iQty">數量</param>
        /// <param name="iPrice">單價</param>
        /// <param name="sCartID">交易批號</param>
        public static void AddRow(string sProdNo, string sImg, string sProdName, string sProdStyle, string sSize, int iQty, int iPrice, string sCartID)
        {
            int iAmount;
            DataRow[] dr = BuyCart.Select("pNo='" + sProdNo + "' AND pStyle='"+ sProdStyle + "' AND size='" + sSize + "'");
            if (dr.Length > 0)
            {
                for (int i = 0; i < BuyCart.Rows.Count; i++)
                {
                    if (BuyCart.Rows[i]["pNo"].ToString() == sProdNo && BuyCart.Rows[i]["pStyle"].ToString() == sProdStyle && BuyCart.Rows[i]["size"].ToString() == sSize)
                    {
                        int total = 0;
                        total = int.Parse(BuyCart.Rows[i]["qty"].ToString()) + iQty;
                        BuyCart.Rows[i]["qty"] = total.ToString();
                        iAmount = int.Parse(BuyCart.Rows[i]["qty"].ToString()) * int.Parse(BuyCart.Rows[i]["price"].ToString());
                        BuyCart.Rows[i]["amount"] = iAmount.ToString();
                    }
                }

            }
            else
            {
                if (string.IsNullOrEmpty(sCartID)) sCartID = CartID;
                iAmount = iQty * iPrice;
                string str_rowid = Guid.NewGuid().ToString();
                BuyCart.Rows.Add(sProdNo, sImg, sProdName, sProdStyle, sSize, iQty, iPrice, iAmount, DateTime.Now, sCartID, str_rowid);
            }
            
        }
        /// <summary>
        /// 更改購物車商品數量
        /// </summary>
        public static void changeQty(string sRowid, int value)
        {
            for (int i = 0; i < BuyCart.Rows.Count; i++)
            {
                if (BuyCart.Rows[i]["rowid"].ToString() == sRowid)
                {
                    BuyCart.Rows[i]["qty"] = value;
                }
            }
            
        }

        /// <summary>
        /// 計算購物車件數
        /// </summary>
        public static string Total()
        {
            //DataRow[] drSum = BuyCart.Select("cart_id='" + CartID + "'");
            string s_sum = BuyCart.Compute("SUM(qty)", "").ToString();
            if(s_sum == "")
            {
                return "0";
            }
            else
            {
                return s_sum;
            }
            
        }

        /// <summary>
        /// 計算購物車總金額
        /// </summary>
        public static string TotalPrice()
        {
            //DataRow[] drSum = BuyCart.Select("cart_id='" + CartID + "'");
            string s_sum = BuyCart.Compute("SUM(amount)", "").ToString();
            if (s_sum == "")
            {
                return "0";
            }
            else
            {
                return s_sum;
            }

        }
        /// <summary>
        /// 刪除購物車記錄
        /// </summary>
        /// <param name="iRow">記錄ID</param>
        /// <param name="bConfirm">確定要刪除</param>
        public static void DeleteRow(int iRow, bool bConfirm)
        {
            BuyCart.Rows[iRow].Delete();
            if (bConfirm) BuyCart.AcceptChanges();
        }
        /// <summary>
        /// 更新購物車
        /// </summary>
        /// <param name="iRow">記錄ID</param>
        /// <param name="sColumn">欄位名稱</param>
        /// <param name="ovalue">欄位值</param>
        public static void UpdateRow(int iRow, string sColumn, object ovalue)
        {
            BuyCart.Rows[iRow][sColumn] = ovalue;
        }
        /// <summary>
        /// 取得目前使用者當前交易批次的訂單
        /// </summary>
        /// <returns></returns>
        public static DataTable GetBuyCart()
        {
            string str_filter = "cart_id = '" + CartID + "'";
            DataTable dt_BuyCart = DataTableFilterSort(str_filter , "pNo");
            return dt_BuyCart;
        }

        //public static bool dtHasRow()
        //{
        //    DataRow[] dr = BuyCart.Select();
        //}


        public static void DeleteCart(string sRowID)
        {
            string str_rowid = "";
            if (BuyCart.Rows.Count > 0)
            {
                for (int i = 0; i < BuyCart.Rows.Count; i++)
                {
                    str_rowid = BuyCart.Rows[i]["rowid"].ToString();
                    if (str_rowid == sRowID) BuyCart.Rows[i].Delete();
                }
                BuyCart.AcceptChanges();
            }
        }

        public static void UpdateCart(string sRowID, int iQty)
        {
            string str_rowid = "";
            if (BuyCart.Rows.Count > 0)
            {
                for (int i = 0; i < BuyCart.Rows.Count; i++)
                {
                    str_rowid = BuyCart.Rows[i]["rowid"].ToString();
                    if (str_rowid == sRowID)
                    {
                        BuyCart.Rows[i]["qty"] = iQty;
                        int price = int.Parse(BuyCart.Rows[i]["price"].ToString());
                        BuyCart.Rows[i]["amount"] = iQty * price;
                    }
                }
                BuyCart.AcceptChanges();
            }
        }

        /// <summary>
        /// 清除所有資料
        /// </summary>
        public static void ClearAllData()
        {
            if (BuyCart.Rows.Count > 0)
            {
                for (int i = 0; i < BuyCart.Rows.Count; i++)
                {
                    BuyCart.Rows[i].Delete();
                }
                BuyCart.AcceptChanges();
            }
        }

        /// <summary>
        /// 刪除已取得的交易批次的訂單
        /// </summary>
        public static void DeleteOrder()
        {
            bool bln_delete = false;
            string str_id1 = CartID;
            string str_id2 = "";
            int int_hours = 0;
            DateTime dtm_date1 = DateTime.MinValue;
            DateTime dtm_date2 = DateTime.Now;
            if (BuyCart.Rows.Count > 0)
            {
                for (int i = 0; i < BuyCart.Rows.Count; i++)
                {
                    str_id2 = BuyCart.Rows[i]["cart_id"].ToString();
                    dtm_date1 = DateTime.Parse(BuyCart.Rows[i]["buy_date"].ToString());
                    int_hours = new TimeSpan(dtm_date1.Ticks - dtm_date2.Ticks).Hours;

                    if (str_id1 == str_id2) bln_delete = true;
                    if (int_hours > 3) bln_delete = true;

                    if (bln_delete) BuyCart.Rows[i].Delete();
                }
                BuyCart.AcceptChanges();
            }
        }
        /// <summary>
        /// 對購物車屬性進行過濾與排序
        /// </summary>
        /// <param name="filterExpression">過濾條件</param>
        /// <param name="sortExpression">排序欄位</param>
        /// <returns></returns>
        private static DataTable DataTableFilterSort(string filterExpression, string sortExpression)
        {
            DataView dv = new DataView();
            dv.Table = BuyCart;
            dv.RowFilter = filterExpression;
            dv.Sort = sortExpression;
            DataTable nTable = dv.ToTable();
            return nTable;
        }
        /// <summary>
        /// 對購物車屬性進行過濾與排序
        /// </summary>
        /// <param name="oTable">DataTable</param>
        /// <param name="filterExpression">過濾條件</param>
        /// <param name="sortExpression">排序欄位</param>
        /// <returns></returns>
        private static DataTable DataTableFilterSort(DataTable oTable, string filterExpression, string sortExpression)
        {
            DataTable nTable = oTable.Select(filterExpression, sortExpression).CopyToDataTable();
            return nTable;
        }
    }
}