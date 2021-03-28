using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pantry_app.Models
{
    public class suggestedRecipesModel
    {
        public int id { get; set; }
        public string title { get; set; }
        public string image { get; set; }
        public string imageType { get; set; }
    }
}