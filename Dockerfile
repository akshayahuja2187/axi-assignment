ARG DOTNET_SDK_VERSION

FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_SDK_VERSION}

WORKDIR /app

COPY . .

RUN dotnet publish super-service/src/SuperService.csproj -c Release -o out

EXPOSE 80

ENTRYPOINT ["dotnet", "SuperService.dll"]
