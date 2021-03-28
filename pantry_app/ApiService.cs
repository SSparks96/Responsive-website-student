using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Threading;
using System.Threading.Tasks;
using pantry_app.Models;
using System.Text.Json;
using MySql.Data.MySqlClient.Memcached;



namespace pantry_app
{
    public class ApiService : RecipesAPI
    {
        private static readonly HttpClient client;

        static ApiService()
        {
            client = new HttpClient()
            {
                BaseAddress = new Uri("https://api.spoonacular.com");
            }
        }
    public async Task<List<suggestedRecipesModel>> GetRecipes(string name)
    {
        var url = string.Format("/recipes/complexSearch?query=",name,"&apiKey=9760567e4861451285e88fd0ead8c6a7");
        var result = new List<suggestedRecipesModel>();
        var response = await client.GetAsync(url);
        if (response.IsSussessStatusCode)
        {
            var stringResponse = await response.Content.ReadAsStringAsync();

            result = JsonSerializer.Deserialize<List<suggestedRecipesModel>>(stringResponse,
                new JsonSerializerOptions() { PropertyNamingPolicy = JsonNamingPolicy.CamelCase });
        }
        else
        {
            throw new HttpRequestException(response.ReasonPhrase);
        }
        return result;
        
    }
    
}