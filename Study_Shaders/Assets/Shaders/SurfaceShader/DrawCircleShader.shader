Shader "Custom/DrawCircleShader"
{
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard
        #pragma target 3.0

        struct Input
        {
            float3 worldPos;
        };

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            float dist = distance(fixed3(16.5, 0, 0), IN.worldPos);
            float val = abs(sin(dist*20.0 - _Time*100));
            if(val > 0.98)
            {
                o.Albedo = fixed4(0, 0, 0, 1);
            }
            else if(val > 0.75)
            {
                o.Albedo = fixed4(1, 0, 0, 1);
            }
            else if(val > 0.5)
            {
                o.Albedo = fixed4(0, 1, 0, 1);
            }
            else if(val > 0.3)
            {
                o.Albedo = fixed4(1, 0, 1, 1);
            }
            else if(val > 0.2)
            {
                o.Albedo = fixed4(1, 1, 0, 1);
            }
            else if(val > 0.1)
            {
                o.Albedo = fixed4(0, 1, 1, 1);
            }
            else
            {
                o.Albedo = fixed4(1, 1, 1, 1);
            }
        }
        ENDCG
    }
    FallBack "Diffuse"
}
