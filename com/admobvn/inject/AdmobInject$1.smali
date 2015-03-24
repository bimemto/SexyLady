.class Lcom/admobvn/inject/AdmobInject$1;
.super Landroid/os/CountDownTimer;
.source "AdmobInject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/admobvn/inject/AdmobInject;->initTimer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/admobvn/inject/AdmobInject;


# direct methods
.method constructor <init>(Lcom/admobvn/inject/AdmobInject;JJ)V
    .locals 0
    .param p2, "$anonymous0"    # J
    .param p4, "$anonymous1"    # J

    .prologue
    .line 1
    iput-object p1, p0, Lcom/admobvn/inject/AdmobInject$1;->this$0:Lcom/admobvn/inject/AdmobInject;

    .line 81
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/admobvn/inject/AdmobInject$1;->this$0:Lcom/admobvn/inject/AdmobInject;

    # invokes: Lcom/admobvn/inject/AdmobInject;->displayAd()V
    invoke-static {v0}, Lcom/admobvn/inject/AdmobInject;->access$0(Lcom/admobvn/inject/AdmobInject;)V

    .line 90
    return-void
.end method

.method public onTick(J)V
    .locals 0
    .param p1, "millisUnitFinished"    # J

    .prologue
    .line 85
    return-void
.end method
