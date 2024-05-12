FROM mcr.microsoft.com/dotnet/sdk:$(DOTNET_SDK_VERSION) AS build

WORKDIR /app

COPY . .

RUN dotnet publish super-service/src/SuperService.csproj -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:$(DOTNET_RUNTIME_VERSION)

WORKDIR /app

COPY --from=build /app/out .

EXPOSE 80

ENTRYPOINT ["dotnet", "MySuperService.dll"]
