using MyBlog.Models;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace MyBlog.Controllers
{
    public class HomeController : Controller
    {
        private blogsDBContext db = new blogsDBContext();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Message()
        {
            ViewBag.messages = db.Message.ToList<Message>();
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Message([Bind(Include = "m_content,athor,email,time")] Message message)
        {

            if (ModelState.IsValid)
            {
                db.Message.Add(message);
                db.SaveChanges();

                return RedirectToAction("Message");
            }
            return View(message);
        }

        public ActionResult Article(int id)
        {
            ViewBag.id = id;
            if (id.ToString() == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Articles article = db.Articles.Find(id);
            if (article == null)
            {
                return HttpNotFound();
            }
            return View(article);
        }
        public ActionResult About()
        {
            return View(db.Links.ToList());
        }
        //显示文章列表
        public ActionResult ArticleLists()
        {
            var type = Request.Params["type"];
            var query = from a in db.Articles select a;
            if (!string.IsNullOrEmpty(type))
                query = query.Where(d => d.type == type);

            List<Articles> articles = query.ToList();
            //foreach( Articles a in articles)
            //{
            //    a.time.ToString("yyyy-MM-dd HH:MM:ss");
            //}
            //var lab = from a in articles
            //          from m in db.Label
            //          where a.lid == m.lid
            //          select new Label { lid = m.lid, name = m.name };

            ViewBag.labels = db.Labels.ToList<Labels>();
            //ViewData["labels"] = JsonConvert.SerializeObject(lab);
            return View(articles);
        }
        //public JsonResult labelData()
        //{

        //    var jsonData = from a in db.Articles
        //                   join m in db.Labels
        //                   on a.lid equals m.lid
        //                   select new { m.lid, m.name };

        //    return Json(jsonData, JsonRequestBehavior.AllowGet);

        //}
        public ActionResult Websites()
        {
            return View();
        }
        /// <summary>
        /// 管理员界面
        /// </summary>
        /// <returns></returns>
        public ActionResult AdminSystem()
        {
            return View();
        }
        public ActionResult addArticle()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult addArticle([Bind(Include = "title,type,content")] Articles article)
        {
            if (ModelState.IsValid)
            {
                //article.content = "<pre>" + article.content + "</pre>";
                db.Articles.Add(article);
                db.SaveChanges();
                return RedirectToAction("editArticles");
            }

            return View(article);
        }
        public ActionResult addLabel()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult addLabel([Bind(Include = "name")] Labels label)
        {
            if (ModelState.IsValid)
            {
                db.Labels.Add(label);
                db.SaveChanges();
                return RedirectToAction("editLabels");
            }

            return View(label);
        }

        public ActionResult addLink()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult addLink([Bind(Include = "name,address")] Links link)
        {
            if (ModelState.IsValid)
            {
                db.Links.Add(link);
                db.SaveChanges();
                return RedirectToAction("editLinks");
            }

            return View(link);
        }

        public ActionResult addAnswer(int id, string answer)
        {

            Message msg = db.Message.Find(id);
            msg.answer = answer;
            db.SaveChanges();

            JsonResult json = new JsonResult();
            json.Data = new
            {
                result = "true"
            };
            return json;
        }

        public ActionResult addView(int id)
        {

            Articles article = db.Articles.Find(id);
            article.view = article.view + 1;
            db.SaveChanges();

            JsonResult json = new JsonResult();
            json.Data = new
            {
                result = "true"
            };
            return json;
        }
        public ActionResult addLike(int id)
        {

            Articles article = db.Articles.Find(id);
            article.like = article.like + 1;
            db.SaveChanges();

            JsonResult json = new JsonResult();
            json.Data = new
            {
                result = "true"
            };
            return json;
        }
        public ActionResult Login(string id, string pswd)
        {
            JsonResult json = new JsonResult();
            if (id.Equals("肖雅文") && pswd.Equals("12345"))
            {
                json.Data = new { result = "true" };
            }
            else
            {
                json.Data = new { result = "false" };
            }


            return json;
        }
        public ActionResult editArticles()
        {
            return View(db.Articles.ToList());
        }
        public ActionResult editLabels()
        {
            return View(db.Labels.ToList());
        }
        public ActionResult editLinks()
        {
            return View(db.Links.ToList());
        }
        public ActionResult editMessages()
        {
            return View(db.Message.ToList());
        }

        public ActionResult upgradeArticle(int id)
        {
            if (id.ToString() == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Articles article = db.Articles.Find(id);
            if (article == null)
            {
                return HttpNotFound();
            }
            return View(article);
        }

        // POST: bookinfs/Edit/5
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性，有关 
        // 详细信息，请参阅 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult upgradeArticle([Bind(Include = "id,title,type,content,lid")] Articles article)
        {
            if (ModelState.IsValid)
            {
                db.Entry(article).State = EntityState.Modified;
                db.SaveChanges();
                this.JavaScript("alert('保存成功！');");
                return RedirectToAction("editArticles");
            }
            return View(article);
        }

        public ActionResult upgradeLabel(int id)
        {
            if (id.ToString() == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Labels label = db.Labels.Find(id);
            if (label == null)
            {
                return HttpNotFound();
            }
            return View(label);
        }

        // POST: bookinfs/Edit/5
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性，有关 
        // 详细信息，请参阅 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult upgradeLabel([Bind(Include = "lid,name")] Labels label)
        {
            if (ModelState.IsValid)
            {
                db.Entry(label).State = EntityState.Modified;
                db.SaveChanges();
                //this.JavaScript("alert('保存成功！');");
                return RedirectToAction("editLabels");
            }
            return View(label);
        }

        public ActionResult upgradeLink(int id)
        {
            if (id.ToString() == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Links link = db.Links.Find(id);
            if (link == null)
            {
                return HttpNotFound();
            }
            return View(link);
        }

        // POST: bookinfs/Edit/5
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性，有关 
        // 详细信息，请参阅 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult upgradeLink([Bind(Include = "id,name,address")] Links link)
        {
            if (ModelState.IsValid)
            {
                db.Entry(link).State = EntityState.Modified;
                db.SaveChanges();
                //this.JavaScript("alert('保存成功！');");
                return RedirectToAction("editLinks");
            }
            return View(link);
        }

        //public ActionResult deletArticle(int id)
        //{
        //    if (id.ToString() == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Articles article = db.Articles.Find(id);
        //    if (article == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(article);
        //}
        //[HttpPost, ActionName("deletArticle")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Articles article = db.Articles.Find(id);
        //    db.Articles.Remove(article);
        //    db.SaveChanges();
        //    return RedirectToAction("editArticles");
        //}

        [HttpPost, ActionName("editArticles")]
        public ActionResult deleteArticle(int id)

        {
            Articles article = db.Articles.Find(id);
            db.Articles.Remove(article);
            db.SaveChanges();
            return RedirectToAction("editArticles");
        }

        [HttpPost, ActionName("editLabels")]
        public ActionResult deleteLabel(int id)

        {
            Labels label = db.Labels.Find(id);
            db.Labels.Remove(label);
            db.SaveChanges();
            return RedirectToAction("editLabels");
        }

        [HttpPost, ActionName("editLinks")]
        public ActionResult deleteLink(int id)

        {
            Links link = db.Links.Find(id);
            db.Links.Remove(link);
            db.SaveChanges();
            return RedirectToAction("editLinks");
        }

        [HttpPost, ActionName("editMessages")]
        public ActionResult deleteMessage(int id)

        {
            Message message = db.Message.Find(id);
            db.Message.Remove(message);
            db.SaveChanges();
            return RedirectToAction("editMessages");
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

    }
}