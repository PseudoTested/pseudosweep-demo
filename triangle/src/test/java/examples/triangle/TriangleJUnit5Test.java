package examples.triangle;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TriangleJUnit5Test {
    @Test
    public void testEquilateral() {
        assertEquals(Triangle.Type.EQUILATERAL, Triangle.classify(3, 3, 3));
    }

    @Test
    public void testScalene() {
        assertEquals(Triangle.Type.SCALENE, Triangle.classify(4, 5, 6));
    }

    @Test
    public void testIsoceles() {
        assertEquals(Triangle.Type.ISOSCELES, Triangle.classify(3, 5, 5));
    }

    @Test
    public void testIsoceles2() {
        assertEquals(Triangle.Type.ISOSCELES, Triangle.classify(5, 5, 6));
    }
}