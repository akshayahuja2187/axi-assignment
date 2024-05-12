FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_SDK_VERSION} AS build

WORKDIR /app

COPY . .

RUN dotnet publish super-service/src/SuperService.csproj -c Release -o out

COPY --from=build /app/out/SuperService.dll .

EXPOSE 80

ENTRYPOINT ["dotnet", "SuperService.dll"]
