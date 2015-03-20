.class public Lcom/google/android/gms/internal/as;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/as$a;
    }
.end annotation


# direct methods
.method static a(IIJJJ)J
    .locals 8

    const-wide/32 v6, 0x7fffffff

    const-wide/32 v4, 0x4000ffff

    int-to-long v0, p0

    add-long/2addr v0, v6

    rem-long/2addr v0, v4

    mul-long/2addr v0, p4

    rem-long/2addr v0, v4

    add-long v2, p2, v4

    sub-long v0, v2, v0

    rem-long/2addr v0, v4

    mul-long/2addr v0, p6

    rem-long/2addr v0, v4

    int-to-long v2, p1

    add-long/2addr v2, v6

    rem-long/2addr v2, v4

    add-long/2addr v0, v2

    rem-long/2addr v0, v4

    return-wide v0
.end method

.method static a(JI)J
    .locals 5

    const-wide/32 v3, 0x4000ffff

    if-nez p2, :cond_1

    const-wide/16 p0, 0x1

    :cond_0
    :goto_0
    return-wide p0

    :cond_1
    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    rem-int/lit8 v0, p2, 0x2

    if-nez v0, :cond_2

    mul-long v0, p0, p0

    rem-long/2addr v0, v3

    div-int/lit8 v2, p2, 0x2

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/as;->a(JI)J

    move-result-wide v0

    rem-long p0, v0, v3

    goto :goto_0

    :cond_2
    mul-long v0, p0, p0

    rem-long/2addr v0, v3

    div-int/lit8 v2, p2, 0x2

    invoke-static {v0, v1, v2}, Lcom/google/android/gms/internal/as;->a(JI)J

    move-result-wide v0

    rem-long/2addr v0, v3

    mul-long/2addr v0, p0

    rem-long p0, v0, v3

    goto :goto_0
.end method

.method static a([Ljava/lang/String;II)Ljava/lang/String;
    .locals 3

    array-length v0, p0

    add-int v1, p1, p2

    if-ge v0, v1, :cond_0

    const-string v0, "Unable to construct shingle"

    invoke-static {v0}, Lcom/google/android/gms/internal/gs;->T(Ljava/lang/String;)V

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    move v0, p1

    :goto_1
    add-int v2, p1, p2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_1

    aget-object v2, p0, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    add-int v0, p1, p2

    add-int/lit8 v0, v0, -0x1

    aget-object v0, p0, v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static a(IJI[Ljava/lang/String;ILjava/util/PriorityQueue;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJI[",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/PriorityQueue",
            "<",
            "Lcom/google/android/gms/internal/as$a;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/as$a;

    invoke-static {p4, p3, p5}, Lcom/google/android/gms/internal/as;->a([Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, p2, v1}, Lcom/google/android/gms/internal/as$a;-><init>(JLjava/lang/String;)V

    invoke-virtual {p6, v0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    invoke-virtual {p6}, Ljava/util/PriorityQueue;->size()I

    move-result v0

    if-le v0, p0, :cond_0

    invoke-virtual {p6}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public static a([Ljava/lang/String;IILjava/util/PriorityQueue;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/PriorityQueue",
            "<",
            "Lcom/google/android/gms/internal/as$a;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, v0, p2}, Lcom/google/android/gms/internal/as;->b([Ljava/lang/String;II)J

    move-result-wide v1

    const/4 v3, 0x0

    move v0, p1

    move-object v4, p0

    move v5, p2

    move-object/from16 v6, p3

    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/internal/as;->a(IJI[Ljava/lang/String;ILjava/util/PriorityQueue;)V

    const-wide/32 v3, 0x1001fff

    add-int/lit8 v0, p2, -0x1

    invoke-static {v3, v4, v0}, Lcom/google/android/gms/internal/as;->a(JI)J

    move-result-wide v4

    const/4 v9, 0x1

    move-wide v2, v1

    :goto_0
    array-length v0, p0

    sub-int/2addr v0, p2

    add-int/lit8 v0, v0, 0x1

    if-ge v9, v0, :cond_0

    add-int/lit8 v0, v9, -0x1

    aget-object v0, p0, v0

    invoke-static {v0}, Lcom/google/android/gms/internal/aq;->o(Ljava/lang/String;)I

    move-result v0

    add-int v1, v9, p2

    add-int/lit8 v1, v1, -0x1

    aget-object v1, p0, v1

    invoke-static {v1}, Lcom/google/android/gms/internal/aq;->o(Ljava/lang/String;)I

    move-result v1

    const-wide/32 v6, 0x1001fff

    invoke-static/range {v0 .. v7}, Lcom/google/android/gms/internal/as;->a(IIJJJ)J

    move-result-wide v7

    move v6, p1

    move-object v10, p0

    move v11, p2

    move-object/from16 v12, p3

    invoke-static/range {v6 .. v12}, Lcom/google/android/gms/internal/as;->a(IJI[Ljava/lang/String;ILjava/util/PriorityQueue;)V

    add-int/lit8 v9, v9, 0x1

    move-wide v2, v7

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static b([Ljava/lang/String;II)J
    .locals 9

    const-wide/32 v7, 0x7fffffff

    const-wide/32 v5, 0x4000ffff

    aget-object v0, p0, p1

    invoke-static {v0}, Lcom/google/android/gms/internal/aq;->o(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    add-long/2addr v0, v7

    rem-long v1, v0, v5

    add-int/lit8 v0, p1, 0x1

    :goto_0
    add-int v3, p1, p2

    if-ge v0, v3, :cond_0

    const-wide/32 v3, 0x1001fff

    mul-long/2addr v1, v3

    rem-long/2addr v1, v5

    aget-object v3, p0, v0

    invoke-static {v3}, Lcom/google/android/gms/internal/aq;->o(Ljava/lang/String;)I

    move-result v3

    int-to-long v3, v3

    add-long/2addr v3, v7

    rem-long/2addr v3, v5

    add-long/2addr v1, v3

    rem-long/2addr v1, v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-wide v1
.end method
