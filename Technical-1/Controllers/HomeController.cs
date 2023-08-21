using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Technical_1.Models;

namespace Technical_1.Controllers
{
    
    public class HomeController : Controller
    {
        DataLayer db = new DataLayer();
        public ActionResult Index()
        {
            SqlParameter[] sqls = new SqlParameter[]
            {
                new SqlParameter("@action",3)
            };
            DataTable dt = db.GetTables("sp_student", sqls);
            ViewBag.teacher = dt;


            SqlParameter[] sqls1 = new SqlParameter[]
            {
                new SqlParameter("@action",2)
            };
            DataTable data = db.GetTables("sp_student", sqls1);
            ViewBag.data = data;
           
           return View();
        }
        [HttpPost]
        public ActionResult Index(StudentModel st)
        {
            

                SqlParameter[] parameters = new SqlParameter[]
                {
                new SqlParameter("@action",1),
                new SqlParameter("@FirstName",st.fname),
                new SqlParameter("@LastName",st.lname),
                new SqlParameter("@DateOfBirth",st.dob),
                new SqlParameter("@Gender",st.gender),
                new SqlParameter("@TeacherId",st.teacher)

                };

            
            

            
            int r = db.ExecutedbQuery("sp_student", parameters);


            if (r > 0)
            {
                return Content("<script>alert('Transaction successfully..');location.href='/home/index';</script>");
            }
            else
            {
                return Content("<script>alert('Something went wrong....');location.href='/home/index';</script>");
            }
           
            
        }

        public ActionResult delete(int?id)
        {
            SqlParameter[] sqls = new SqlParameter[]
            {
                new SqlParameter("@action",4),
                new SqlParameter("@Id",id)
            };
            db.ExecutedbQuery("sp_student", sqls);
            return RedirectToAction("index");
        }

        public ActionResult editdata(int?id)
        {
            SqlParameter[] sqls = new SqlParameter[]
            {
                new SqlParameter("@action",3)
            };
            DataTable dt = db.GetTables("sp_student", sqls);
            ViewBag.teacher = dt;

            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@action",6),
                new SqlParameter("@Id",id)
            };
            DataTable data = db.GetTables("sp_student", parameter);
            
            ViewBag.data1 = data.Rows[0];
            return View();

        }
        [HttpPost]
        public ActionResult editdata(StudentModel st)
        {

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@action",5),
                new SqlParameter("@Id",st.id),
                new SqlParameter("@FirstName",st.fname),
                new SqlParameter("@LastName",st.lname),
                new SqlParameter("@DateOfBirth",st.dob),
                new SqlParameter("@Gender",st.gender),
                new SqlParameter("@TeacherId",st.teacher)

            };
            int r = db.ExecutedbQuery("sp_student", parameters);


            if (r > 0)
            {
                return Content("<script>alert('Transaction successfully..');location.href='/home/index';</script>");
            }
            else
            {
                return Content("<script>alert('Something went wrong....');location.href='/home/index';</script>");
            }

            //return RedirectToAction("index");
        }



    }
}