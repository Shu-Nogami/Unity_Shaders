Shader "Unlit/WorldSpaceNormalsShader"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            // 構造体
            // 名前をv2fとし、worldNormalとposを内包する
            struct v2f
            {
                half3 worldNormal : TEXCOORDD;
                float4 pos : SV_POSITION;
            };

            // 頂点シェーダー: 入力としてオブジェクト空間法線も取得
            v2f vert(float4 vertex : POSITION, float3 normal : NORMAL)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(vertex);
                // 関数宣言よりインポートしてきた"UnityCG.cginc"を使用
                // 法線をオブジェクトからワールド座標に変換する
                o.worldNormal = UnityObjectToWorldNormal(normal);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 c = 0;
                // 法線とはxyz成分を持つ3Dベクトル: -1から1が範囲
                // カラー表示は0から1が範囲
                c.rgb = i.worldNormal*0.5+0.5;
                return c;
            }
            
            ENDCG
        }
    }
}
