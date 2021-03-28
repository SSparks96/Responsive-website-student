using pantry_app.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pantry_app
{
    public interface RecipesAPI
    {
        Task<List<suggestedRecipesModel>> Getrecipes(string title);
    }
}
