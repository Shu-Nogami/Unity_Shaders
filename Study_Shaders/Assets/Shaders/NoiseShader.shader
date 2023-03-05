Shader "Unlit/NoiseShader"
{
    Properties
    {
        _Color ("Color", Color) = (1, 1, 1, 1)
        _MainTexture ("Main Texture", 2D) = "white" {}
        _DissolveTexture ("Dissolve Texture", 2D) = "white" {}
        _DissolveCutoff ("Dissolve Cutoff", Range(0, 1)) = 1
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            float4 _Color;
            sampler2D _MainTexture;
            sampler2D _DissolveTexture;
            float _DissolveCutoff;
            
            v2f vert (appdata v)
            {
                v2f OUT;
                OUT.vertex = UnityObjectToClipPos(v.vertex);
                OUT.uv = v.uv;
                return OUT;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float4 textureColor = tex2D(_MainTexture, i.uv);
                float4 dissolveColor = tex2D(_DissolveTexture, i.uv);
                clip(dissolveColor.rgb - _DissolveCutoff);
                return textureColor;
            }
            ENDCG
        }
    }
}
