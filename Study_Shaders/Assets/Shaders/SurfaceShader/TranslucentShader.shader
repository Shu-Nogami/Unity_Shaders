Shader "Custom/TranslucentShader"
{
    SubShader
    {
        // Queueは描画優先度を制定する
        // Background Geometry AlphaTest Transparent Overlayの順番で描画される
        // そのためBackgroundやGeometryなどの不透明オブジェクトを描画してから今回の描画されている
        Tags { "Queue" = "Transparent" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard alpha:fade
        #pragma target 3.0

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = fixed4(0.6f, 0.7f, 0.4f, 1);
            o.Alpha = 0.6;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
