using BlazorNet8.Client.DemoData;
using Havit.Blazor.Components.Web;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

var builder = WebAssemblyHostBuilder.CreateDefault(args);

builder.Services.AddHxServices();
builder.Services.AddHxMessenger();
builder.Services.AddHxMessageBoxHost();

builder.Services.AddSingleton<IDemoDataService, DemoDataService>();
builder.Services.AddTransient<HtmlRenderer, HtmlRenderer>();

await builder.Build().RunAsync();
