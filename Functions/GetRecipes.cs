using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace MealPlanner.Functions
{
    public static class GetRecipes
    {
        [FunctionName("GetRecipes")]
        public static async Task<IActionResult> Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = null)] HttpRequest req, ILogger log)
        {
            var responseMessage = "** GetRecipes **";

            log.LogInformation(responseMessage);

            return new OkObjectResult(responseMessage);
        }
    }
}
